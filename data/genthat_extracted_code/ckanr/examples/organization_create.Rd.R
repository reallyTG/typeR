library(ckanr)


### Name: organization_create
### Title: Create an organization
### Aliases: organization_create

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # create an organization
##D (res <- organization_create("foobar", title = "Foo bars", description = "love foo bars"))
##D res$name
## End(Not run)



