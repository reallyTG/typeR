library(ckanr)


### Name: as.ckan_group
### Title: ckan_group class helpers
### Aliases: as.ckan_group is.ckan_group

### ** Examples

## Not run: 
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D (grps <- group_list())
##D grps[[3]]
##D 
##D # create item class from only an item ID
##D as.ckan_group(grps[[3]]$id)
##D 
##D # gives back itself
##D (x <- as.ckan_group(grps[[3]]$id))
##D as.ckan_group(x)
## End(Not run)



