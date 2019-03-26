library(solrium)


### Name: config_overlay
### Title: Get Solr configuration overlay
### Aliases: config_overlay

### ** Examples

## Not run: 
##D # start Solr with Cloud mode via the schemaless eg: bin/solr -e cloud
##D # you can create a new core like: bin/solr create -c corename
##D # where <corename> is the name for your core - or creaate as below
##D 
##D # connect
##D (conn <- SolrClient$new())
##D 
##D # get config overlay
##D conn$config_overlay("gettingstarted")
##D 
##D # without header
##D conn$config_overlay("gettingstarted", omitHeader = TRUE)
## End(Not run)



