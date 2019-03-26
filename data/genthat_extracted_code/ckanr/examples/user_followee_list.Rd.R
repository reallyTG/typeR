library(ckanr)


### Name: user_followee_list
### Title: Return a a user's follower count
### Aliases: user_followee_list

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # list package activity
##D user_followee_list('sckottie')
##D 
##D # input a ckan_user object
##D (x <- user_show('sckottie'))
##D user_follower_list(x)
##D 
##D # output different data formats
##D user_follower_list(x, as = "table")
##D user_follower_list(x, as = "json")
## End(Not run)



