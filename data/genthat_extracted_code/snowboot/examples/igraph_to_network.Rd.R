library(snowboot)


### Name: igraph_to_network
### Title: Create a "Network" Object from an igraph Object
### Aliases: igraph_to_network

### ** Examples

hex_ring <- igraph::make_ring(6, directed = FALSE, mutual = FALSE, circular = TRUE)
net <- igraph_to_network(hex_ring)



