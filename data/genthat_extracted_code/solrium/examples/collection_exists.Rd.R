library(solrium)


### Name: collection_exists
### Title: Check if a collection exists
### Aliases: collection_exists

### ** Examples

## Not run: 
##D # start Solr with Cloud mode via the schemaless eg: bin/solr -e cloud
##D # you can create a new core like: bin/solr create -c corename
##D # where <corename> is the name for your core - or creaate as below
##D (conn <- SolrClient$new())
##D 
##D # exists
##D conn$collection_exists("gettingstarted")
##D 
##D # doesn't exist
##D conn$collection_exists("hhhhhh")
## End(Not run)



