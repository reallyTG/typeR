library(igraph)


### Name: coreness
### Title: K-core decomposition of graphs
### Aliases: coreness graph.coreness
### Keywords: graphs

### ** Examples


g <- make_ring(10)
g <- add_edges(g, c(1,2, 2,3, 1,3))
coreness(g) 		# small core triangle in a ring




