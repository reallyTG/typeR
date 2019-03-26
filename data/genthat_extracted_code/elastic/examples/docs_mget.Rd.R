library(elastic)


### Name: docs_mget
### Title: Get multiple documents via the multiple get API.
### Aliases: docs_mget

### ** Examples

## Not run: 
##D connect()
##D 
##D if (!index_exists('plos')) {
##D   plosdat <- system.file("examples", "plos_data.json", package = "elastic")
##D   invisible(docs_bulk(plosdat))
##D }
##D 
##D # Same index and type
##D docs_mget(index="plos", type="article", ids=c(9,10))
##D 
##D tmp <- docs_mget(index="plos", type="article", ids=c(9, 10), 
##D   raw=TRUE)
##D es_parse(tmp)
##D docs_mget(index="plos", type="article", ids=c(9, 10), 
##D   source='title')
##D docs_mget(index="plos", type="article", ids=c(14, 19), 
##D   source=TRUE)
##D 
##D # curl options
##D library("httr")
##D docs_mget(index="plos", type="article", ids=1:2, callopts=verbose())
##D 
##D # Same index, but different types
##D if (!index_exists('shakespeare')) {
##D   shakedat <- system.file("examples", "shakespeare_data.json", package = "elastic")
##D   invisible(docs_bulk(shakedat))
##D }
##D 
##D docs_mget(index="shakespeare", type_id=list(c("scene",1), c("line",20)))
##D docs_mget(index="shakespeare", type_id=list(c("scene",1), c("line",20)), 
##D   source='play_name')
##D 
##D # Different indices and different types pass in separately
##D docs_mget(index_type_id = list(
##D   c("shakespeare", "line", 20), 
##D   c("plos", "article", 1)
##D  )
##D )
## End(Not run)



