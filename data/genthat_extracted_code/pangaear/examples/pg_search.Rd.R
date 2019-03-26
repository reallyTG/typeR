library(pangaear)


### Name: pg_search
### Title: Search the Pangaea database
### Aliases: pg_search

### ** Examples

## Not run: 
##D pg_search(query='water')
##D pg_search(query='water', count=2)
##D pg_search(query='water', count=20)
##D pg_search(query='water', mindate="2013-06-01", maxdate="2013-07-01")
##D pg_search(query='water', bbox=c(-124.2, 41.8, -116.8, 46.1))
##D pg_search(query='reference:Archer')
##D pg_search(query='parameter:"carbon dioxide"')
##D pg_search(query='event:M2-track')
##D pg_search(query='event:TT011_2-CTD31')
##D pg_search(query='project:Joint Global Ocean Flux Study')
##D pg_search(query='campaign:M2')
##D pg_search(query='basis:Meteor')
##D 
##D # paging with count and offset
##D # max is 500 records per request - if you need > 500, use offset and count
##D res1 <- pg_search(query = "florisphaera", count = 500, offset = 0)
##D res2 <- pg_search(query = "florisphaera", count = 500, offset = 500)
##D res3 <- pg_search(query = "florisphaera", count = 500, offset = 1000)
##D do.call("rbind.data.frame", list(res1, res2, res3))
##D 
##D # get attributes: maxScore, totalCount, and offset
##D res <- pg_search(query='water', bbox=c(-124.2, 41.8, -116.8, 46.1))
##D attributes(res)
##D attr(res, "maxScore")
##D attr(res, "totalCount")
##D attr(res, "offset")
##D 
##D # curl options
##D pg_search(query='citation:Archer', verbose = TRUE)
## End(Not run)



