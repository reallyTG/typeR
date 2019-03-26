library(igraph)


### Name: bipartite_mapping
### Title: Decide whether a graph is bipartite
### Aliases: bipartite_mapping bipartite.mapping
### Keywords: graphs

### ** Examples


## A ring has just one loop, so it is fine
g <- make_ring(10)
bipartite_mapping(g)

## A star is fine, too
g2 <- make_star(10)
bipartite_mapping(g2)

## A graph containing a triangle is not fine
g3 <- make_ring(10)
g3 <- add_edges(g3, c(1,3))
bipartite_mapping(g3)



