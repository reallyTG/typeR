library(shopifyr)


### Name: ShopifyShop
### Title: ShopifyShop class
### Aliases: ShopifyShop
### Keywords: datasets

### ** Examples

## Not run: 
##D # Before you can access the API, you must create a ShopifyShop object using your credentials
##D shop <- ShopifyShop$new("yourstore.myshopify.com","private_app_password")
##D 
##D # Get all smart collections
##D collections <- shop$getSmartCollections()
##D 
##D # Search for customers named Bob from the United States
##D bobs <- shop$searchCustomers("Bob country:United States")
##D 
##D # Create a new product
##D product <- list(title="The R Inferno",
##D                 body="<b>The R Inferno</b><i>by Patrick Burns</i>",
##D                 vendor="Burns Statistics",
##D                 product_type="Paperback",
##D                 images=list(list(src="http://www.burns-stat.com/wp-content/
##D                                       uploads/2012/12/R_inferno_cover.jpg")))
##D newProduct <- shop$createProduct(product)
## End(Not run)



