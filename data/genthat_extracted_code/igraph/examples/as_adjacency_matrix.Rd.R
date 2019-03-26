library(igraph)


### Name: as_adjacency_matrix
### Title: Convert a graph to an adjacency matrix
### Aliases: as_adjacency_matrix get.adjacency as_adj

### ** Examples


g <- sample_gnp(10, 2/10)
as_adjacency_matrix(g)
V(g)$name <- letters[1:vcount(g)]
as_adjacency_matrix(g)
E(g)$weight <- runif(ecount(g))
as_adjacency_matrix(g, attr="weight")



