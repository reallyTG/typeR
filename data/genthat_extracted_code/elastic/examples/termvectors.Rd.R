library(elastic)


### Name: termvectors
### Title: Termvectors
### Aliases: termvectors

### ** Examples

## Not run: 
##D connect()
##D if (!index_exists('plos')) {
##D   plosdat <- system.file("examples", "plos_data.json", package = "elastic")
##D   invisible(docs_bulk(plosdat))
##D }
##D if (!index_exists('omdb')) {
##D   omdb <- system.file("examples", "omdb.json", package = "elastic")
##D   invisible(docs_bulk(omdb))
##D }
##D 
##D body <- '{
##D   "fields" : ["title"],
##D   "offsets" : true,
##D   "positions" : true,
##D   "term_statistics" : true,
##D   "field_statistics" : true
##D }'
##D termvectors('plos', 'article', 29, body = body)
##D 
##D body <- '{
##D   "fields" : ["Plot"],
##D   "offsets" : true,
##D   "positions" : true,
##D   "term_statistics" : true,
##D   "field_statistics" : true
##D }'
##D termvectors('omdb', 'omdb', 'AVXdx8Eqg_0Z_tpMDyP_', body = body)
## End(Not run)



