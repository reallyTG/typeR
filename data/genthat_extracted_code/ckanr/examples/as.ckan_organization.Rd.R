library(ckanr)


### Name: as.ckan_organization
### Title: ckan_organization class helpers
### Aliases: as.ckan_organization is.ckan_organization

### ** Examples

## Not run: 
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D (orgs <- organization_list())
##D orgs[[3]]
##D 
##D # create item class from only an item ID
##D as.ckan_organization(orgs[[3]]$id)
##D 
##D # gives back itself
##D (x <- as.ckan_organization(orgs[[3]]$id))
##D as.ckan_organization(x)
## End(Not run)



