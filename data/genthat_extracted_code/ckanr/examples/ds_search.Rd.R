library(ckanr)


### Name: ds_search
### Title: Datastore - search or get a dataset from CKRAN datastore
### Aliases: ds_search

### ** Examples

## Not run: 
##D url <- 'http://demo.ckan.org/'
##D ds_search(resource_id = 'f4129802-22aa-4437-b9f9-8a8f3b7b2a53', url = url)
##D ds_search(resource_id = 'f4129802-22aa-4437-b9f9-8a8f3b7b2a53', url = url, as = "table")
##D ds_search(resource_id = 'f4129802-22aa-4437-b9f9-8a8f3b7b2a53', url = url, as = "json")
##D 
##D ds_search(resource_id = 'f4129802-22aa-4437-b9f9-8a8f3b7b2a53', url = url, limit = 1, as = "table")
##D ds_search(resource_id = 'f4129802-22aa-4437-b9f9-8a8f3b7b2a53', url = url, q = "a*")
## End(Not run)



