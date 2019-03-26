library(igraph)


### Name: cluster_edge_betweenness
### Title: Community structure detection based on edge betweenness
### Aliases: cluster_edge_betweenness edge.betweenness.community
### Keywords: graphs

### ** Examples


g <- sample_pa(100, m = 2, directed = FALSE)
eb <- cluster_edge_betweenness(g)

g <- make_full_graph(10) %du% make_full_graph(10)
g <- add_edges(g, c(1,11))
eb <- cluster_edge_betweenness(g)
eb




