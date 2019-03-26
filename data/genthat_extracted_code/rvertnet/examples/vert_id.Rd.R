library(rvertnet)


### Name: vert_id
### Title: Search by Vertnet occurrence ID
### Aliases: vert_id

### ** Examples

## Not run: 
##D vert_id(ids = "urn:catalog:CM:Herps:116520")
##D ids <- c("http://arctos.database.museum/guid/MSB:Mamm:56979?seid=1643089", 
##D          "urn:catalog:CM:Herps:116520",
##D          "urn:catalog:AUM:Fish:13271")
##D res <- vert_id(ids)
##D res$data$occurrenceid
##D 
##D out <- vertsearch(taxon = "aves", state = "california", limit = 5)
##D (ids <- out$data$occurrenceid)
##D res <- vert_id(ids)
##D identical(sort(res$data$occurrenceid), sort(ids))
## End(Not run)



