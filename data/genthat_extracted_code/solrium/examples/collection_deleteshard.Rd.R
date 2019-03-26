library(solrium)


### Name: collection_deleteshard
### Title: Delete a shard
### Aliases: collection_deleteshard

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D # create collection
##D if (!conn$collection_exists("buffalo")) {
##D   conn$collection_create(name = "buffalo")
##D   # OR: bin/solr create -c buffalo
##D }
##D 
##D # find shard names
##D names(conn$collection_clusterstatus()$cluster$collections$buffalo$shards)
##D 
##D # split a shard by name
##D collection_splitshard(conn, name = "buffalo", shard = "shard1")
##D 
##D # now we have three shards
##D names(conn$collection_clusterstatus()$cluster$collections$buffalo$shards)
##D 
##D # delete shard
##D conn$collection_deleteshard(name = "buffalo", shard = "shard1_1")
## End(Not run)



