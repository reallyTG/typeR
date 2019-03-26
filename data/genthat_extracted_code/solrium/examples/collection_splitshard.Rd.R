library(solrium)


### Name: collection_splitshard
### Title: Create a shard
### Aliases: collection_splitshard

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D # create collection
##D if (!conn$collection_exists("trees")) {
##D   conn$collection_create("trees")
##D }
##D 
##D # find shard names
##D names(conn$collection_clusterstatus()$cluster$collections$trees$shards)
##D 
##D # split a shard by name
##D conn$collection_splitshard(name = "trees", shard = "shard1")
##D 
##D # now we have three shards
##D names(conn$collection_clusterstatus()$cluster$collections$trees$shards)
## End(Not run)



