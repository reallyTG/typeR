library(solrium)


### Name: collection_balanceshardunique
### Title: Balance a property
### Aliases: collection_balanceshardunique

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D # create collection
##D if (!conn$collection_exists("addrep")) {
##D   conn$collection_create(name = "mycollection")
##D   # OR: bin/solr create -c mycollection
##D }
##D 
##D # balance preferredLeader property
##D conn$collection_balanceshardunique("mycollection", property = "preferredLeader")
##D 
##D # examine cluster status
##D conn$collection_clusterstatus()$cluster$collections$mycollection
## End(Not run)



