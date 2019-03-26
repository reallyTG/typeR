library(ckanr)


### Name: user_follower_count
### Title: Return a a user's follower count
### Aliases: user_follower_count

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # list package activity
##D user_follower_count('sckottie')
##D 
##D # input a ckan_user object
##D (x <- user_show('sckottie'))
##D user_follower_count(x)
##D 
##D # output different data formats
##D user_follower_count(x, as = "table")
##D user_follower_count(x, as = "json")
## End(Not run)



