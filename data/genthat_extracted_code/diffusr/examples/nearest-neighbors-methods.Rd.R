library(diffusr)


### Name: nearest.neighbors
### Title: Graph diffusion using nearest neighbors
### Aliases: nearest.neighbors nearest.neighbors,integer,matrix-method

### ** Examples

 # count of nodes
 n <- 10
 # indexes (integer) of nodes for which neighbors should be searched
 node.idxs <- c(1L, 5L)
 # the adjaceny matrix (does not need to be symmetric)
 graph <- rbind(cbind(0, diag(n-1)), 0)
 # compute the neighbors until depth 3
 neighs <- nearest.neighbors(node.idxs, graph, 3)



