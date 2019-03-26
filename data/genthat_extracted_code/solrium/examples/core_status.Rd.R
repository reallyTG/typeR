library(solrium)


### Name: core_status
### Title: Get core status
### Aliases: core_status

### ** Examples

## Not run: 
##D # start Solr with Schemaless mode via the schemaless eg:
##D #   bin/solr start -e schemaless
##D # you can create a new core like: bin/solr create -c corename
##D # where <corename> is the name for your core - or creaate as below
##D 
##D # connect
##D (conn <- SolrClient$new())
##D 
##D # Status of all cores
##D conn$core_status()
##D 
##D # Status of particular cores
##D conn$core_status("gettingstarted")
##D 
##D # Get index info or not
##D ## Default: TRUE
##D conn$core_status("gettingstarted", indexInfo = TRUE)
##D conn$core_status("gettingstarted", indexInfo = FALSE)
## End(Not run)



