library(ckanr)


### Name: as.ckan_user
### Title: ckan_user class helpers
### Aliases: as.ckan_user is.ckan_user

### ** Examples

## Not run: 
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D (usrs <- user_list())
##D usrs$results
##D usrs$results[[3]]
##D 
##D # create item class from only an item ID
##D as.ckan_user(usrs$results[[3]]$id)
##D 
##D # gives back itself
##D (x <- as.ckan_user(usrs$results[[3]]$id))
##D as.ckan_user(x)
## End(Not run)



