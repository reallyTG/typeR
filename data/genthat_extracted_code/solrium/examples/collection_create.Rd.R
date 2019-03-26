library(solrium)


### Name: collection_create
### Title: Add a collection
### Aliases: collection_create

### ** Examples

## Not run: 
##D # connect
##D (cli <- SolrClient$new())
##D 
##D if (!cli$collection_exists("helloWorld")) {
##D   cli$collection_create(name = "helloWorld")
##D }
##D if (!cli$collection_exists("tablesChairs")) {
##D   cli$collection_create(name = "tablesChairs")
##D }
## End(Not run)



