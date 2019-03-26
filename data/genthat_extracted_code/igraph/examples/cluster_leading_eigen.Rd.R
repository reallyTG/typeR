library(igraph)


### Name: cluster_leading_eigen
### Title: Community structure detecting based on the leading eigenvector
###   of the community matrix
### Aliases: cluster_leading_eigen leading.eigenvector.community
### Keywords: graphs

### ** Examples


g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
g <- add_edges(g, c(1,6, 1,11, 6, 11))
lec <- cluster_leading_eigen(g)
lec

cluster_leading_eigen(g, start=membership(lec))




