library(ckanr)


### Name: related_delete
### Title: Delete a related item.
### Aliases: related_delete

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # create a package and a related item
##D res <- package_create("hello-venus2") %>%
##D    related_create(title = "my resource",
##D                   type = "visualization")
##D 
##D # show the related item
##D related_delete(res)
##D ## or with id itself:
##D ## related_delete(res$id)
## End(Not run)



