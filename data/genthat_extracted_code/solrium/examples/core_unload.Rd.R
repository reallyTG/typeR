library(solrium)


### Name: core_unload
### Title: Unload (delete) a core
### Aliases: core_unload

### ** Examples

## Not run: 
##D # start Solr with Schemaless mode via the schemaless eg:
##D #   bin/solr start -e schemaless
##D 
##D # connect
##D (conn <- SolrClient$new())
##D 
##D # Create a core
##D conn$core_create(name = "books")
##D 
##D # Unload a core
##D conn$core_unload(name = "books")
##D ## not found
##D # conn$core_unload(name = "books")
##D # > Error: 400 - Cannot unload non-existent core [books]
## End(Not run)



