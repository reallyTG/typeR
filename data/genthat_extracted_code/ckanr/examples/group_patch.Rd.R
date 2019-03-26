library(ckanr)


### Name: group_patch
### Title: Update a group's metadata
### Aliases: group_patch

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org", key = getOption("ckan_demo_key"))
##D 
##D # Create a package
##D (res <- group_create("hello-my-world2"))
##D 
##D # Get a resource
##D grp <- group_show(res$id)
##D grp$title
##D grp$author_email
##D 
##D # Make some changes
##D x <- list(title = "!hello world!", maintainer_email = "hello@world.com")
##D group_patch(x, id = grp)
## End(Not run)



