<!DOCTYPE html>
<html ng-app="gemStore">
  <head>
    <link rel="stylesheet" type="text/css" href="bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="application.css" />
    <script type="text/javascript" src="angular.min.js"></script>
    <script type="text/javascript" src="app.js"></script>
  </head>
  <body ng-controller="StoreController as store">
	<div id="wrap">
		  <div id="content">
		    <header>
		      <h1 class="text-center">Flatlander Crafted Gems</h1>
		      <h2 class="text-center">&#45; an Angular store &#45;</h2>
		    </header>
		    <div class="list-group">
		      <div class="list-group-item" ng-repeat="product in store.products">
		        <h3>{{product.name}} <em class="pull-right">{{product.price | currency}}</em></h3>
		        <div ng-controller="GalleryController as gallery"  ng-show="product.images.length">
		          <div class="img-wrap">
		            <img ng-src="{{product.images[gallery.current]}}" />
			          <ul class="img-thumbnails clearfix">
			            <li class="small-image pull-left thumbnail" ng-repeat="image in product.images">
			              <img ng-src="{{image}}" class="thumb"/>
			            </li>
			          </ul>
		          </div>
		        </div>
		        <section ng-controller="TabController as tab">
		          <ul class="nav nav-pills">
		            <li ng-class="{ active:tab.isSet(1) }">
		              <a href="" ng-click="tab.setTab(1)">Description</a>
		            </li>
		            <li ng-class="{ active:tab.isSet(2) }">
		              <a href="" ng-click="tab.setTab(2)">Specs</a>
		            </li>
		            <li ng-class="{ active:tab.isSet(3) }">
		              <a href="" ng-click="tab.setTab(3)">Reviews</a>
		            </li>
		          </ul>
		          <div ng-show="tab.isSet(1)">
		            <h4>Description</h4>
		            <blockquote>{{product.description}}</blockquote>
		          </div>
		          <div ng-show="tab.isSet(2)">
		            <h4>Specs</h4>
		            <blockquote>Shine: {{product.shine}}</blockquote>
		          </div>
		          <div ng-show="tab.isSet(3)">
		            <ul>
		              <h4>Reviews</h4>
		              <li ng-repeat="review in product.reviews">
		                <blockquote>
		                  <strong>{{review.stars}} Stars</strong>
		                  {{review.body}}
		                  <cite class="clearfix">&#45;{{review.author}}</cite>
		                </blockquote>
		              </li>
		            </ul>

		            <!--  Review Form -->
		            <form name="reviewForm" novalidate ng-controller="ReviewController as reviewCtrl" ng-submit="reviewForm.$valid && reviewCtrl.addReview(product)">
		              <!--  Live Preview -->
		              <blockquote>
		                <strong>{{review.stars}} Stars</strong>
		                {{review.body}}
		                <cite class="clearfix">&#45;{{review.author}} on {{review.createdOn | date: 'dd/MM/yyyy'}}</cite>
		              </blockquote>

		              <!--  Review Form -->
		              <h4>Submit a Review</h4>
		              <fieldset class="form-group">
		                <select class="form-control" required ng-model="review.stars" ng-options="stars for stars in [5,4,3,2,1]"  title="Stars">
		                  <option value="">Rate the Product</option>
		                </select>
		              </fieldset>
		              <fieldset class="form-group">
		                <textarea class="form-control" ng-model="review.body" placeholder="Write a short review of the product..." title="Review"></textarea>
		              </fieldset>
		              <fieldset class="form-group">
		                <input type="email" class="form-control" required ng-model="review.author" placeholder="joe.bloggs@example.org" title="Email" />
		              </fieldset>
		              <fieldset class="form-group">
		                <input type="submit" class="btn btn-primary pull-right" value="Submit Review" />
		              </fieldset>
		            </form>

		          </div>
		        </section>
		      </div>
		    </div>
	    </div>
	</div>
  </body>
</html>
