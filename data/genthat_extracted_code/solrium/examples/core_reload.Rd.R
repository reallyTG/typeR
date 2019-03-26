library(solrium)


### Name: core_reload
### Title: Reload a core
### Aliases: core_reload

### ** Examples

## Not run: 
##D # start Solr with Schemaless mode via the schemaless eg:
##D #  bin/solr start -e schemaless
##D # you can create a new core like: bin/solr create -c corename
##D # where <corename> is the name for your core - or creaate as below
##D 
##D # connect
##D (conn <- SolrClient$new())
##D 
##D # Status of particular cores
##D conn$core_reload("gettingstarted")
##D conn$core_status("gettingstarted")
## End(Not run)



