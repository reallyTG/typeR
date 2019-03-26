library(solrium)


### Name: core_split
### Title: Split a core
### Aliases: core_split

### ** Examples

## Not run: 
##D # start Solr with Schemaless mode via the schemaless eg: bin/solr start -e schemaless
##D # you can create a new core like: bin/solr create -c corename
##D # where <corename> is the name for your core - or creaate as below
##D 
##D # connect
##D (conn <- SolrClient$new())
##D 
##D # Swap a core
##D ## First, create two cores
##D # conn$core_split("splitcoretest0") # or create in the CLI: bin/solr create -c splitcoretest0
##D # conn$core_split("splitcoretest1") # or create in the CLI: bin/solr create -c splitcoretest1
##D # conn$core_split("splitcoretest2") # or create in the CLI: bin/solr create -c splitcoretest2
##D 
##D ## check status
##D conn$core_status("splitcoretest0", FALSE)
##D conn$core_status("splitcoretest1", FALSE)
##D conn$core_status("splitcoretest2", FALSE)
##D 
##D ## split core using targetCore parameter
##D conn$core_split("splitcoretest0", targetCore = c("splitcoretest1", "splitcoretest2"))
##D 
##D ## split core using split.key parameter
##D ### Here all documents having the same route key as the split.key i.e. 'A!'
##D ### will be split from the core index and written to the targetCore
##D conn$core_split("splitcoretest0", targetCore = "splitcoretest1", split.key = "A!")
##D 
##D ## split core using ranges parameter
##D ### Solr expects hash ranges in hexidecimal, but since we're in R,
##D ### let's not make our lives any harder, so you can pass in numbers
##D ### but you can still pass in hexidecimal if you want.
##D rgs <- c('0-1f4', '1f5-3e8')
##D conn$core_split("splitcoretest0", targetCore = c("splitcoretest1", "splitcoretest2"), ranges = rgs)
##D rgs <- list(c(0, 500), c(501, 1000))
##D conn$core_split("splitcoretest0", targetCore = c("splitcoretest1", "splitcoretest2"), ranges = rgs)
## End(Not run)



