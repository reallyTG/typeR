library(solrium)


### Name: config_get
### Title: Get Solr configuration details
### Aliases: config_get

### ** Examples

## Not run: 
##D # start Solr with Cloud mode via the schemaless eg: bin/solr -e cloud
##D # you can create a new core like: bin/solr create -c corename
##D # where <corename> is the name for your core - or creaate as below
##D 
##D # connect
##D (conn <- SolrClient$new())
##D 
##D # all config settings
##D conn$config_get("gettingstarted")
##D 
##D # just znodeVersion
##D conn$config_get("gettingstarted", "znodeVersion")
##D 
##D # just znodeVersion
##D conn$config_get("gettingstarted", "luceneMatchVersion")
##D 
##D # just updateHandler
##D conn$config_get("gettingstarted", "updateHandler")
##D 
##D # just updateHandler
##D conn$config_get("gettingstarted", "requestHandler")
##D 
##D ## Get XML
##D conn$config_get("gettingstarted", wt = "xml")
##D conn$config_get("gettingstarted", "updateHandler", wt = "xml")
##D conn$config_get("gettingstarted", "requestHandler", wt = "xml")
##D 
##D ## Raw data - what param ignored when raw=TRUE
##D conn$config_get("gettingstarted", raw = TRUE)
## End(Not run)



