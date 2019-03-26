library(ckanr)


### Name: package_search
### Title: Search for packages.
### Aliases: package_search

### ** Examples

## Not run: 
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D package_search(q = '*:*')
##D package_search(q = '*:*', rows = 2, as = 'json')
##D package_search(q = '*:*', rows = 2, as = 'table')
##D 
##D package_search(q = '*:*', sort = 'score asc')
##D package_search(q = '*:*', fq = 'num_tags:[3 TO *]')$count
##D package_search(q = '*:*', fq = 'num_tags:[2 TO *]')$count
##D package_search(q = '*:*', fq = 'num_tags:[1 TO *]')$count
## End(Not run)



