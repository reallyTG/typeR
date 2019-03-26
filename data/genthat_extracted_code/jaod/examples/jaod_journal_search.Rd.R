library(jaod)


### Name: jaod_journal_search
### Title: Search for journals
### Aliases: jaod_journal_search

### ** Examples

## Not run: 
##D out <- jaod_journal_search(query = "bibjson.keywords:heritage")
##D out
##D out$results
##D 
##D jaod_journal_search(query = "issn:1544-9173")
##D jaod_journal_search(query = "publisher:dove")
##D 
##D # sorting
##D out <- jaod_journal_search(query = "bibjson.keywords:heritage",
##D   sort = "bibjson.oa_start.year:desc")
##D out$results$bibjson.oa_start.year
## End(Not run)



