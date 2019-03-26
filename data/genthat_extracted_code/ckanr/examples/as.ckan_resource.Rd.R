library(ckanr)


### Name: as.ckan_resource
### Title: ckan_resource class helpers
### Aliases: as.ckan_resource is.ckan_resource

### ** Examples

## Not run: 
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D (resrcs <- resource_search(q = 'name:data'))
##D resrcs$results
##D resrcs$results[[3]]
##D 
##D # create item class from only an item ID
##D as.ckan_resource(resrcs$results[[3]]$id)
##D 
##D # gives back itself
##D (x <- as.ckan_resource(resrcs$results[[3]]$id))
##D as.ckan_resource(x)
## End(Not run)



