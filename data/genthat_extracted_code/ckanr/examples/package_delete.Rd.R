library(ckanr)


### Name: package_delete
### Title: Delete a package
### Aliases: package_delete

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org", key = getOption("ckan_demo_key"))
##D 
##D # create a package
##D (res <- package_create("lions-bears-tigers"))
##D 
##D # show the package
##D package_show(res)
##D 
##D # delete the package
##D package_delete(res)
## End(Not run)



