library(ckanr)


### Name: related_create
### Title: Create a related item
### Aliases: related_create

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # create a package
##D (res <- package_create("hello-mars"))
##D 
##D # create a related item
##D related_create(res, title = "asdfdaf", type = "idea")
##D 
##D # pipe operations together
##D package_create("foobbbbbarrrr") %>%
##D    related_create(title = "my resource",
##D                   type = "visualization")
## End(Not run)



