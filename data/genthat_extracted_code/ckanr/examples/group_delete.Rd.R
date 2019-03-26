library(ckanr)


### Name: group_delete
### Title: Delete a group
### Aliases: group_delete

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org", key = getOption("ckan_demo_key"))
##D 
##D # create a group
##D (res <- group_create("lions", description="A group about lions"))
##D 
##D # show the group
##D group_show(res$id)
##D 
##D # delete the group
##D group_delete(res)
##D ## or with it's id
##D # group_delete(res$id)
## End(Not run)



