library(solrium)


### Name: collection_deletereplica
### Title: Delete a replica
### Aliases: collection_deletereplica

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D # create collection
##D if (!conn$collection_exists("foobar2")) {
##D   conn$collection_create(name = "foobar2", maxShardsPerNode = 2)
##D }
##D 
##D # status
##D conn$collection_clusterstatus()$cluster$collections$foobar2$shards$shard1
##D 
##D # add replica
##D conn$collection_addreplica(name = "foobar2", shard = "shard1")
##D 
##D # delete replica
##D ## get replica name
##D nms <- names(conn$collection_clusterstatus()$cluster$collections$foobar2$shards$shard1$replicas)
##D conn$collection_deletereplica(name = "foobar2", shard = "shard1", replica = nms[1])
##D 
##D # status again
##D conn$collection_clusterstatus()$cluster$collections$foobar2$shards$shard1
## End(Not run)



