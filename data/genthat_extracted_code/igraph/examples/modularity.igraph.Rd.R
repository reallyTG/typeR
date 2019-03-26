library(igraph)


### Name: modularity.igraph
### Title: Modularity of a community structure of a graph
### Aliases: modularity.igraph modularity modularity_matrix mod.matrix
### Keywords: graphs

### ** Examples


g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
g <- add_edges(g, c(1,6, 1,11, 6, 11))
wtc <- cluster_walktrap(g)
modularity(wtc)
modularity(g, membership(wtc))




