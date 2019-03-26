library(ckanr)


### Name: package_update
### Title: Update a package
### Aliases: package_update

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # First, show a package to see the fields
##D res <- package_show('585d7ea2-ded0-4fed-9b08-61f7e83a3cb2')
##D res
##D 
##D ## update just chosen things
##D # Make some changes
##D x <- list(maintainer_email = "heythere2@things.com")
##D 
##D # Then update the packge
##D package_update(x, '585d7ea2-ded0-4fed-9b08-61f7e83a3cb2')
## End(Not run)



