library(igraph)


### Name: is_weighted
### Title: Weighted graphs
### Aliases: is_weighted is.weighted
### Keywords: graphs

### ** Examples


g <- make_ring(10)
shortest_paths(g, 8, 2)
E(g)$weight <- seq_len(ecount(g))
shortest_paths(g, 8, 2)




