library(solrium)


### Name: schema
### Title: Get the schema for a collection or core
### Aliases: schema

### ** Examples

## Not run: 
##D # start Solr, in your CLI, run: `bin/solr start -e cloud -noprompt`
##D # after that, if you haven't run `bin/post -c gettingstarted docs/` yet, do so
##D 
##D # connect: by default we connect to localhost, port 8983
##D (cli <- SolrClient$new())
##D 
##D # get the schema for the gettingstarted index
##D schema(cli, name = "gettingstarted")
##D 
##D # Get parts of the schema
##D schema(cli, name = "gettingstarted", "fields")
##D schema(cli, name = "gettingstarted", "dynamicfields")
##D schema(cli, name = "gettingstarted", "fieldtypes")
##D schema(cli, name = "gettingstarted", "copyfields")
##D schema(cli, name = "gettingstarted", "name")
##D schema(cli, name = "gettingstarted", "version")
##D schema(cli, name = "gettingstarted", "uniquekey")
##D schema(cli, name = "gettingstarted", "similarity")
##D schema(cli, name = "gettingstarted", "solrqueryparser/defaultoperator")
##D 
##D # get raw data
##D schema(cli, name = "gettingstarted", "similarity", raw = TRUE)
##D schema(cli, name = "gettingstarted", "uniquekey", raw = TRUE)
##D 
##D # start Solr in Schemaless mode: bin/solr start -e schemaless
##D # schema(cli, "gettingstarted")
##D 
##D # start Solr in Standalone mode: bin/solr start
##D # then add a core: bin/solr create -c helloWorld
##D # schema(cli, "helloWorld")
## End(Not run)



