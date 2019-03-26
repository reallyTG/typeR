library(ckanr)


### Name: package_create
### Title: Create a package
### Aliases: package_create

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # create a package
##D ## Example 1
##D (res <- package_create("foobar4", author="Jane Doe"))
##D res$author
##D 
##D ## Example 2 - create package, add a resource
##D (res <- package_create("helloworld", author="Jane DOe"))
##D 
## End(Not run)



