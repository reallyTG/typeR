library(igraph)


### Name: embed_laplacian_matrix
### Title: Spectral Embedding of the Laplacian of a Graph
### Aliases: embed_laplacian_matrix
### Keywords: graphs

### ** Examples


## A small graph
lpvs <- matrix(rnorm(200), 20, 10)
lpvs <- apply(lpvs, 2, function(x) { return (abs(x)/sqrt(sum(x^2))) })
RDP <- sample_dot_product(lpvs)
embed <- embed_laplacian_matrix(RDP, 5)



