library(ckanr)


### Name: as.ckan_package
### Title: ckan_package class helpers
### Aliases: as.ckan_package is.ckan_package

### ** Examples

## Not run: 
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D (pkgs <- package_search())
##D pkgs$results
##D pkgs$results[[3]]
##D 
##D # create item class from only an item ID
##D as.ckan_package("0699f475-6978-473a-8448-42585074b6f1")
##D 
##D # gives back itself
##D (x <- as.ckan_package("0699f475-6978-473a-8448-42585074b6f1"))
##D as.ckan_package(x)
## End(Not run)



