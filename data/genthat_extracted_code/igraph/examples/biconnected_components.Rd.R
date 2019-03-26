library(igraph)


### Name: biconnected_components
### Title: Biconnected components
### Aliases: biconnected_components biconnected.components
### Keywords: graphs

### ** Examples


g <- disjoint_union( make_full_graph(5), make_full_graph(5) )
clu <- components(g)$membership
g <- add_edges(g, c(which(clu==1), which(clu==2)))
bc <- biconnected_components(g)



