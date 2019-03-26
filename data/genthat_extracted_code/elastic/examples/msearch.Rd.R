library(elastic)


### Name: msearch
### Title: Multi-search
### Aliases: msearch

### ** Examples

## Not run: 
##D connect()
##D msearch1 <- system.file("examples", "msearch_eg1.json", package = "elastic")
##D readLines(msearch1)
##D msearch(msearch1)
##D 
##D cat('{"index" : "shakespeare"}', file = "~/mysearch.json", sep = "\n")
##D cat('{"query" : {"match_all" : {}}, "from" : 0, "size" : 5}',  sep = "\n",
##D    file = "~/mysearch.json", append = TRUE)
##D msearch("~/mysearch.json")
## End(Not run)



