library(igraph)


### Name: compare
### Title: Compares community structures using various metrics
### Aliases: compare compare.communities compare.membership
### Keywords: graphs

### ** Examples


g <- make_graph("Zachary")
sg <- cluster_spinglass(g)
le <- cluster_leading_eigen(g)
compare(sg, le, method="rand")
compare(membership(sg), membership(le))




