library(solrium)


### Name: core_rename
### Title: Rename a core
### Aliases: core_rename

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
##D # Status of particular cores
##D path <- "~/solr-7.0.0/server/solr/testcore/conf"
##D dir.create(path, recursive = TRUE)
##D files <- list.files(
##D "~/solr-7.0.0/server/solr/configsets/sample_techproducts_configs/conf/",
##D full.names = TRUE)
##D invisible(file.copy(files, path, recursive = TRUE))
##D conn$core_create("testcore") # or create in CLI: bin/solr create -c testcore
##D 
##D # rename
##D conn$core_rename("testcore", "newtestcore")
##D ## status
##D conn$core_status("testcore") # core missing
##D conn$core_status("newtestcore", FALSE) # not missing
##D 
##D # cleanup
##D conn$core_unload("newtestcore")
## End(Not run)



