library(igraph)


### Name: cluster_walktrap
### Title: Community strucure via short random walks
### Aliases: cluster_walktrap walktrap.community
### Keywords: graphs

### ** Examples


g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
g <- add_edges(g, c(1,6, 1,11, 6, 11))
cluster_walktrap(g)




