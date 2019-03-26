library(ckanr)


### Name: resource_delete
### Title: Delete a resource.
### Aliases: resource_delete

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # create a package
##D (res <- package_create("yellow9"))
##D 
##D # then create a resource
##D file <- system.file("examples", "actinidiaceae.csv", package = "ckanr")
##D (xx <- resource_create(res,
##D                        description = "my resource",
##D                        name = "bears",
##D                        upload = file,
##D                        rcurl = "http://google.com"
##D ))
##D 
##D # delete the resource
##D resource_delete(xx)
## End(Not run)



