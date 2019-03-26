library(ckanr)


### Name: user_activity_list
### Title: Return a list of a user's activities
### Aliases: user_activity_list

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # list package activity
##D user_activity_list('sckottie')
##D 
##D # input a ckan_user object
##D (x <- user_show('sckottie'))
##D user_activity_list(x)
##D 
##D # output different data formats
##D user_activity_list(x, as = "table")
##D user_activity_list(x, as = "json")
## End(Not run)



