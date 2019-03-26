library(igraph)


### Name: cluster_fast_greedy
### Title: Community structure via greedy optimization of modularity
### Aliases: cluster_fast_greedy fastgreedy.community
### Keywords: graphs

### ** Examples


g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
g <- add_edges(g, c(1,6, 1,11, 6, 11))
fc <- cluster_fast_greedy(g)
membership(fc)
sizes(fc)




