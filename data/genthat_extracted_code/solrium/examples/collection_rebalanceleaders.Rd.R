library(solrium)


### Name: collection_rebalanceleaders
### Title: Rebalance leaders
### Aliases: collection_rebalanceleaders

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D # create collection
##D if (!conn$collection_exists("mycollection2")) {
##D   conn$collection_create(name = "mycollection2")
##D   # OR: bin/solr create -c mycollection2
##D }
##D 
##D # balance preferredLeader property
##D conn$collection_balanceshardunique("mycollection2", property = "preferredLeader")
##D 
##D # balance preferredLeader property
##D conn$collection_rebalanceleaders("mycollection2")
##D 
##D # examine cluster status
##D conn$collection_clusterstatus()$cluster$collections$mycollection2
## End(Not run)



