library(elastic)


### Name: search_shards
### Title: Search shards.
### Aliases: search_shards

### ** Examples

## Not run: 
##D search_shards(index = "plos")
##D search_shards(index = c("plos","gbif"))
##D search_shards(index = "plos", preference='_primary')
##D search_shards(index = "plos", preference='_shards:2')
##D 
##D library('httr')
##D search_shards(index = "plos", config=verbose())
## End(Not run)



