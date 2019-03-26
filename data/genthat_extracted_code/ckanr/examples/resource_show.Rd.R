library(ckanr)


### Name: resource_show
### Title: Show a resource.
### Aliases: resource_show

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # create a package
##D (res <- package_create("yellow7"))
##D 
##D # then create a resource
##D file <- system.file("examples", "actinidiaceae.csv", package = "ckanr")
##D (xx <- resource_create(package_id = res$id,
##D                        description = "my resource",
##D                        name = "bears",
##D                        upload = file,
##D                        rcurl = "http://google.com"
##D ))
##D 
##D # show the resource
##D resource_show(xx$id)
##D 
##D 
##D # eg. from the NHM CKAN store
##D resource_show(id = "05ff2255-c38a-40c9-b657-4ccb55ab2feb",
##D               url = "http://data.nhm.ac.uk")
## End(Not run)



