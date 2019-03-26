library(loe)


### Name: spec.emb
### Title: Spectral embedding with the normalized or the unnormalized
###   Laplacian (Laplacian eigenmaps).
### Aliases: spec.emb

### ** Examples

library(igraph)
ADM <- as.matrix( get.adjacency(graph.famous("Icosahedral")) )

#Apply some graph embedding methods
LE <-spec.emb(A=ADM,2,norm=FALSE)



