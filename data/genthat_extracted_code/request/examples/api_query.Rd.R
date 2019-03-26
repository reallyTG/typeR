library(request)


### Name: api_query
### Title: Query construction
### Aliases: api_query api_query_

### ** Examples

## Not run: 
##D ## NSE
##D api("http://api.plos.org/search") %>%
##D   api_query(q = ecology, wt = json, fl = 'id,journal') %>%
##D   peep
##D 
##D api("http://api.plos.org/search") %>%
##D   api_query(q = ecology, wt = json, fl = id, fl = journal) %>%
##D   peep
##D 
##D ## SE
##D api("http://api.plos.org/search") %>%
##D   api_query_(q = "ecology", wt = "json", fl = 'id', fl = 'journal') %>%
##D   peep
##D 
##D ## NSE
##D api("http://api.plos.org/search") %>%
##D   api_query(q = ecology, wt = json, fl = 'id,journal')
##D ## SE
##D api("http://api.plos.org/search") %>%
##D   api_query_(q = "ecology", wt = "json", fl = 'id', fl = 'journal')
## End(Not run)



