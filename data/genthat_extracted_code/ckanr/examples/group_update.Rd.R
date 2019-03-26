library(ckanr)


### Name: group_update
### Title: Update a group
### Aliases: group_update

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # First, create a group
##D grp <- group_create("water-bears2")
##D group_show(grp)
##D 
##D ## update just chosen things
##D # Make some changes
##D x <- list(description = "A group about water bears and people that love them")
##D 
##D # Then update the packge
##D group_update(x, id = grp)
## End(Not run)



