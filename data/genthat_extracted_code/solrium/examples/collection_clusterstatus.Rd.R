library(solrium)


### Name: collection_clusterstatus
### Title: Get cluster status
### Aliases: collection_clusterstatus

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D conn$collection_clusterstatus()
##D res <- conn$collection_clusterstatus()
##D res$responseHeader
##D res$cluster
##D res$cluster$collections
##D res$cluster$collections$gettingstarted
##D res$cluster$live_nodes
## End(Not run)



