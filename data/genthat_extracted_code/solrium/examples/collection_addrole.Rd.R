library(solrium)


### Name: collection_addrole
### Title: Add a role to a node
### Aliases: collection_addrole

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D # get list of nodes
##D nodes <- conn$collection_clusterstatus()$cluster$live_nodes
##D collection_addrole(conn, node = nodes[1])
## End(Not run)



