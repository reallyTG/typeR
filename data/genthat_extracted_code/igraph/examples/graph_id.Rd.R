library(igraph)


### Name: graph_id
### Title: Get the id of a graph
### Aliases: graph_id

### ** Examples

g <- make_ring(10)
graph_id(g)
graph_id(V(g))
graph_id(E(g))

g2 <- g + 1
graph_id(g2)



