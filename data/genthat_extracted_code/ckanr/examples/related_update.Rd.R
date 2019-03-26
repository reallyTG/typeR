library(ckanr)


### Name: related_update
### Title: Update a related item
### Aliases: related_update

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # create a package and related item
##D res <- package_create("hello-saturn2") %>%
##D    related_create(title = "my resource",
##D                   type = "visualization")
##D 
##D # update the related item
##D related_update(res, title = "her resource", type = "idea")
## End(Not run)



