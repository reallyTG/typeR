library(solrium)


### Name: core_swap
### Title: Swap a core
### Aliases: core_swap

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
##D # Swap a core
##D ## First, create two cores
##D conn$core_create("swapcoretest1")
##D # - or create on CLI: bin/solr create -c swapcoretest1
##D conn$core_create("swapcoretest2")
##D # - or create on CLI: bin/solr create -c swapcoretest2
##D 
##D ## check status
##D conn$core_status("swapcoretest1", FALSE)
##D conn$core_status("swapcoretest2", FALSE)
##D 
##D ## swap core
##D conn$core_swap("swapcoretest1", "swapcoretest2")
##D 
##D ## check status again
##D conn$core_status("swapcoretest1", FALSE)
##D conn$core_status("swapcoretest2", FALSE)
## End(Not run)



