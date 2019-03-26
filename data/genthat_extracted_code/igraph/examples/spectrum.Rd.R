library(igraph)


### Name: spectrum
### Title: Eigenvalues and eigenvectors of the adjacency matrix of a graph
### Aliases: spectrum graph.eigen igraph.eigen.default
### Keywords: graphs

### ** Examples


## Small example graph, leading eigenvector by default
kite <- make_graph("Krackhardt_kite")
spectrum(kite)[c("values", "vectors")]

## Double check
eigen(as_adj(kite, sparse=FALSE))$vectors[,1]

## Should be the same as 'eigen_centrality' (but rescaled)
cor(eigen_centrality(kite)$vector, spectrum(kite)$vectors)

## Smallest eigenvalues
spectrum(kite, which=list(pos="SM", howmany=2))$values




