library(ckanr)


### Name: resource_patch
### Title: Update a resource's metadata
### Aliases: resource_patch

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org", key = getOption("ckan_demo_key"))
##D 
##D # Get a resource
##D res <- resource_show("b85948b6-f9ea-4392-805e-00511d6cf6c6")
##D res$description
##D 
##D # Make some changes
##D x <- list(description = "My newer description")
##D resource_patch(x, id = res)
##D # or pass id in directly
##D # resource_patch(x, id = res$id)
## End(Not run)



