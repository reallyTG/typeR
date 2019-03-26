library(solrium)


### Name: collection_delete
### Title: Add a collection
### Aliases: collection_delete

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D if (!conn$collection_exists("helloWorld")) {
##D   conn$collection_create(name = "helloWorld")
##D }
##D 
##D collection_delete(conn, name = "helloWorld")
## End(Not run)



