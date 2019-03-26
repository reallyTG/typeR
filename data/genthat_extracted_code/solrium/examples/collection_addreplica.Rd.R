library(solrium)


### Name: collection_addreplica
### Title: Add a replica
### Aliases: collection_addreplica

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D # create collection
##D if (!conn$collection_exists("foobar")) {
##D   conn$collection_create(name = "foobar", numShards = 2)
##D   # OR bin/solr create -c foobar
##D }
##D 
##D # status
##D conn$collection_clusterstatus()$cluster$collections$foobar
##D 
##D # add replica
##D if (!conn$collection_exists("foobar")) {
##D   conn$collection_addreplica(name = "foobar", shard = "shard1")
##D }
##D 
##D # status again
##D conn$collection_clusterstatus()$cluster$collections$foobar
##D conn$collection_clusterstatus()$cluster$collections$foobar$shards
##D conn$collection_clusterstatus()$cluster$collections$foobar$shards$shard1
## End(Not run)



