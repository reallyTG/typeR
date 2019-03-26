library(ckanr)


### Name: resource_create
### Title: Create a resource
### Aliases: resource_create

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # create a package
##D (res <- package_create("foobarrrr", author="Jane Doe"))
##D 
##D # then create a resource
##D file <- system.file("examples", "actinidiaceae.csv", package = "ckanr")
##D (xx <- resource_create(package_id = "585d7ea2-ded0-4fed-9b08-61f7e83a3cb2",
##D                        description = "my resource",
##D                        name = "bears",
##D                        upload = file,
##D                        rcurl = "http://google.com"
##D ))
##D 
##D package_create("foobbbbbarrrr") %>%
##D    resource_create(description = "my resource",
##D    name = "bearsareus", upload = file, rcurl = "http://google.com")
## End(Not run)



