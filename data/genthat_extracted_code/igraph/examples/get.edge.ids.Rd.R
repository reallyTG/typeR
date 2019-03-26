library(igraph)


### Name: get.edge.ids
### Title: Find the edge ids based on the incident vertices of the edges
### Aliases: get.edge.ids

### ** Examples


g <- make_ring(10)
ei <- get.edge.ids(g, c(1,2, 4,5))
E(g)[ei]

## non-existant edge
get.edge.ids(g, c(2,1, 1,4, 5,4))




