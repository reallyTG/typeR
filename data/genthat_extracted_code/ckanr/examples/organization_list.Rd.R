library(ckanr)


### Name: organization_list
### Title: List organization
### Aliases: organization_list

### ** Examples

## Not run: 
##D ckanr_setup(url = "http://demo.ckan.org/")
##D 
##D # list organizations
##D res <- organization_list()
##D res[1:2]
##D 
##D # Different data formats
##D organization_list(as = 'json')
##D organization_list(as = 'table')
## End(Not run)



