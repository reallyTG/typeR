library(ckanr)


### Name: as.ckan_related
### Title: ckan_related class helpers
### Aliases: as.ckan_related is.ckan_related

### ** Examples

## Not run: 
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D (x <- package_create("foobbbbbarrrr") %>%
##D    related_create(title = "my resource",
##D                   type = "visualization"))
##D 
##D # create item class from only an item ID
##D as.ckan_related(x$id)
##D 
##D # gives back itself
##D (x <- as.ckan_related(x$id))
##D as.ckan_related(x)
## End(Not run)



