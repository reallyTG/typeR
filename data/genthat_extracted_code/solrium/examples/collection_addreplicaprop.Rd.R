library(solrium)


### Name: collection_addreplicaprop
### Title: Add a replica property
### Aliases: collection_addreplicaprop

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D # create collection
##D if (!conn$collection_exists("addrep")) {
##D   conn$collection_create(name = "addrep", numShards = 1)
##D   # OR bin/solr create -c addrep
##D }
##D 
##D # status
##D conn$collection_clusterstatus()$cluster$collections$addrep$shards
##D 
##D # add the value world to the property hello
##D conn$collection_addreplicaprop(name = "addrep", shard = "shard1",
##D   replica = "core_node1", property = "hello", property.value = "world")
##D 
##D # check status
##D conn$collection_clusterstatus()$cluster$collections$addrep$shards
##D conn$collection_clusterstatus()$cluster$collections$addrep$shards$shard1$replicas$core_node1
## End(Not run)



