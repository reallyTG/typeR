library(igraph)


### Name: laplacian_matrix
### Title: Graph Laplacian
### Aliases: laplacian_matrix graph.laplacian
### Keywords: graphs

### ** Examples


g <- make_ring(10)
laplacian_matrix(g)
laplacian_matrix(g, norm=TRUE)
laplacian_matrix(g, norm=TRUE, sparse=FALSE)




