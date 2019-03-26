library(solrium)


### Name: collection_deletealias
### Title: Delete a collection alias
### Aliases: collection_deletealias

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D if (!conn$collection_exists("thingsstuff")) {
##D   conn$collection_create(name = "thingsstuff")
##D }
##D 
##D conn$collection_createalias("tstuff", "thingsstuff")
##D conn$collection_clusterstatus()$cluster$collections$thingsstuff$aliases # new alias
##D conn$collection_deletealias("tstuff")
##D conn$collection_clusterstatus()$cluster$collections$thingsstuff$aliases # gone
## End(Not run)



