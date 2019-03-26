library(ckanr)


### Name: package_activity_list
### Title: Return a list of the package's activity
### Aliases: package_activity_list

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # create a package
##D (res <- package_create("owls6"))
##D 
##D # list package activity
##D package_activity_list(res$id)
##D 
##D # make a change
##D x <- list(maintainer = "Jane Forest")
##D package_update(x, res)
##D 
##D # list activity again
##D package_activity_list(res)
##D 
##D # output different data formats
##D package_activity_list(res$id, as = "table")
##D package_activity_list(res$id, as = "json")
## End(Not run)



