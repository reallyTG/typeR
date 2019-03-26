library(solrium)


### Name: collection_deletereplicaprop
### Title: Delete a replica property
### Aliases: collection_deletereplicaprop

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D # create collection
##D if (!conn$collection_exists("deleterep")) {
##D   conn$collection_create(name = "deleterep")
##D   # OR bin/solr create -c deleterep
##D }
##D 
##D # status
##D conn$collection_clusterstatus()$cluster$collections$deleterep$shards
##D 
##D # add the value bar to the property foo
##D conn$collection_addreplicaprop(name = "deleterep", shard = "shard1",
##D   replica = "core_node1", property = "foo", property.value = "bar")
##D 
##D # check status
##D conn$collection_clusterstatus()$cluster$collections$deleterep$shards
##D conn$collection_clusterstatus()$cluster$collections$deleterep$shards$shard1$replicas$core_node1
##D 
##D # delete replica property
##D conn$collection_deletereplicaprop(name = "deleterep", shard = "shard1",
##D    replica = "core_node1", property = "foo")
##D 
##D # check status - foo should be gone
##D conn$collection_clusterstatus()$cluster$collections$deleterep$shards$shard1$replicas$core_node1
## End(Not run)



