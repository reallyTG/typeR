library(ckanr)


### Name: package_show
### Title: Show a package.
### Aliases: package_show

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # create a package
##D (res <- package_create("purposeful55"))
##D 
##D # show package
##D ## From the output of package_create
##D package_show(res)
##D ## Or, from the ID
##D package_show(res$id)
##D 
##D # get data back in different formats
##D package_show(res$id, as = 'json')
##D package_show(res$id, as = 'table')
##D 
##D # use default schema or not
##D package_show(res$id, TRUE)
## End(Not run)



