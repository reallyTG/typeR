library(solrium)


### Name: core_exists
### Title: Check if a core exists
### Aliases: core_exists

### ** Examples

## Not run: 
##D # start Solr with Schemaless mode via the schemaless eg:
##D #   bin/solr start -e schemaless
##D # you can create a new core like: bin/solr create -c corename
##D # where <corename> is the name for your core - or create as below
##D 
##D # connect
##D (conn <- SolrClient$new())
##D 
##D # exists
##D conn$core_exists("gettingstarted")
##D 
##D # doesn't exist
##D conn$core_exists("hhhhhh")
## End(Not run)



