library(solrium)


### Name: core_create
### Title: Create a core
### Aliases: core_create

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
##D # Create a core
##D path <- "~/solr-7.0.0/server/solr/newcore/conf"
##D dir.create(path, recursive = TRUE)
##D files <- list.files("~/solr-7.0.0/server/solr/configsets/sample_techproducts_configs/conf/",
##D full.names = TRUE)
##D invisible(file.copy(files, path, recursive = TRUE))
##D conn$core_create(name = "newcore", instanceDir = "newcore",
##D   configSet = "sample_techproducts_configs")
## End(Not run)



