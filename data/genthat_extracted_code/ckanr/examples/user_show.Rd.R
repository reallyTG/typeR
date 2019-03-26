library(ckanr)


### Name: user_show
### Title: Show a user.
### Aliases: user_show

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # show user
##D user_show('sckottie')
##D 
##D # include datasets
##D user_show('sckottie', include_datasets = TRUE)
##D 
##D # include datasets
##D user_show('sckottie', include_num_followers = TRUE)
## End(Not run)



