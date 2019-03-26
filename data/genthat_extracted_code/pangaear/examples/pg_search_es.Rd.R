library(pangaear)


### Name: pg_search_es
### Title: Search the Pangaea database with Elasticsearch
### Aliases: pg_search_es

### ** Examples

## Not run: 
##D (res <- pg_search_es())
##D attributes(res)
##D attr(res, "total")
##D attr(res, "max_score")
##D 
##D pg_search_es(query = 'water', source = c('parentURI', 'minElevation'))
##D pg_search_es(query = 'water', size = 3)
##D pg_search_es(query = 'water', size = 3, from = 10)
##D 
##D pg_search_es(query = 'water sky', default_operator = "OR")
##D pg_search_es(query = 'water sky', default_operator = "AND")
##D 
##D pg_search_es(query = 'water', sort = "minElevation")
##D pg_search_es(query = 'water', sort = "minElevation:desc")
## End(Not run)



