library(solrium)


### Name: config_set
### Title: Set Solr configuration details
### Aliases: config_set

### ** Examples

## Not run: 
##D # start Solr with Cloud mode via the schemaless eg: bin/solr -e cloud
##D # you can create a new core like: bin/solr create -c corename
##D # where <corename> is the name for your core - or creaate as below
##D 
##D # connect
##D (conn <- SolrClient$new())
##D 
##D # set a property
##D conn$config_set("gettingstarted", 
##D   set = list(query.filterCache.autowarmCount = 1000))
##D 
##D # unset a property
##D conn$config_set("gettingstarted", unset = "query.filterCache.size", 
##D   verbose = TRUE)
##D 
##D # both set a property and unset a property
##D conn$config_set("gettingstarted", unset = "enableLazyFieldLoading")
##D 
##D # many properties
##D conn$config_set("gettingstarted", set = list(
##D    query.filterCache.autowarmCount = 1000,
##D    query.commitWithin.softCommit = 'false'
##D  )
##D )
## End(Not run)



