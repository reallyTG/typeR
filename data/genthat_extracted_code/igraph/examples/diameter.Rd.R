library(igraph)


### Name: diameter
### Title: Diameter of a graph
### Aliases: diameter get.diameter farthest.nodes farthest_vertices
###   get_diameter
### Keywords: graphs

### ** Examples


g <- make_ring(10)
g2 <- delete_edges(g, c(1,2,1,10))
diameter(g2, unconnected=TRUE)
diameter(g2, unconnected=FALSE)

## Weighted diameter
set.seed(1)
g <- make_ring(10)
E(g)$weight <- sample(seq_len(ecount(g)))
diameter(g)
get_diameter(g)
diameter(g, weights=NA)
get_diameter(g, weights=NA)




