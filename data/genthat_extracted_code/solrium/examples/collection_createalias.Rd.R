library(solrium)


### Name: collection_createalias
### Title: Create an alias for a collection
### Aliases: collection_createalias

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D if (!conn$collection_exists("thingsstuff")) {
##D   conn$collection_create(name = "thingsstuff")
##D }
##D 
##D conn$collection_createalias("tstuff", "thingsstuff")
##D conn$collection_clusterstatus()$cluster$collections$thingsstuff$aliases
## End(Not run)



