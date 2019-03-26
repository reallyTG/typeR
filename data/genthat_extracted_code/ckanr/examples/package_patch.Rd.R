library(ckanr)


### Name: package_patch
### Title: Update a package's metadata
### Aliases: package_patch

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org", key = getOption("ckan_demo_key"))
##D 
##D # Create a package
##D (res <- package_create("hello-world7", author="Jane Doe"))
##D 
##D # Get a resource
##D res <- package_show(res$id)
##D res$title
##D res$author_email
##D 
##D # Make some changes
##D x <- list(title = "!hello there world! bye")
##D package_patch(x, id = res$id)
## End(Not run)



