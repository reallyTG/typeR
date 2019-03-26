library(solrium)


### Name: collection_reload
### Title: Reload a collection
### Aliases: collection_reload

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D if (!conn$collection_exists("helloWorld")) {
##D   conn$collection_create(name = "helloWorld")
##D }
##D 
##D conn$collection_reload(name = "helloWorld")
## End(Not run)



