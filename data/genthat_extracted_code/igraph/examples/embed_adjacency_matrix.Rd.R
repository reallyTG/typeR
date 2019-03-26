library(igraph)


### Name: embed_adjacency_matrix
### Title: Spectral Embedding of Adjacency Matrices
### Aliases: embed_adjacency_matrix
### Keywords: graphs

### ** Examples


## A small graph
lpvs <- matrix(rnorm(200), 20, 10)
lpvs <- apply(lpvs, 2, function(x) { return (abs(x)/sqrt(sum(x^2))) })
RDP <- sample_dot_product(lpvs)
embed <- embed_adjacency_matrix(RDP, 5)



