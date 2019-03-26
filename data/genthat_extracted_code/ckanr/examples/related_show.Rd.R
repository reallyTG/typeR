library(ckanr)


### Name: related_show
### Title: Show a related item
### Aliases: related_show

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # create a package and a related item
##D res <- package_create("hello-pluto2") %>%
##D    related_create(title = "my resource",
##D                   type = "visualization")
##D 
##D # show the related item
##D related_show(res)
##D related_show(res$id)
##D 
##D # get data back in different formats
##D related_show(res, as = 'json')
##D related_show(res, as = 'table')
## End(Not run)



