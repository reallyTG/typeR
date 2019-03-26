library(solrium)


### Name: core_mergeindexes
### Title: Merge indexes (cores)
### Aliases: core_mergeindexes

### ** Examples

## Not run: 
##D # start Solr with Schemaless mode via the schemaless eg:
##D #  bin/solr start -e schemaless
##D 
##D # connect
##D (conn <- SolrClient$new())
##D 
##D ## FIXME: not tested yet
##D 
##D # use indexDir parameter
##D conn$core_mergeindexes(core="new_core_name",
##D    indexDir = c("/solr_home/core1/data/index",
##D    "/solr_home/core2/data/index"))
##D 
##D # use srcCore parameter
##D conn$core_mergeindexes(name = "new_core_name", srcCore = c('core1', 'core2'))
## End(Not run)



