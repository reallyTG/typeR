library(solrium)


### Name: collection_removerole
### Title: Remove a role from a node
### Aliases: collection_removerole

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D # get list of nodes
##D nodes <- conn$collection_clusterstatus()$cluster$live_nodes
##D conn$collection_addrole(node = nodes[1])
##D conn$collection_removerole(node = nodes[1])
## End(Not run)



