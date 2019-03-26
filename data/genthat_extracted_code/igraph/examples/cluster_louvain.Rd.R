library(igraph)


### Name: cluster_louvain
### Title: Finding community structure by multi-level optimization of
###   modularity
### Aliases: cluster_louvain multilevel.community
### Keywords: graphs

### ** Examples


# This is so simple that we will have only one level
g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
g <- add_edges(g, c(1,6, 1,11, 6, 11))
cluster_louvain(g)




