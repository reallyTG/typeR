library(netdep)


### Name: make.permute.moran
### Title: Permutation Test of Moran's I
### Aliases: make.permute.moran

### ** Examples

library(netdep)
library(igraph)
library(igraphdata)
data(karate)
A = as.matrix(get.adjacency(karate, attr= "weight", sparse = TRUE)) # weighted adjacency matrix
Y = V(karate)$Faction
result = make.permute.moran(A, Y, np = 100)





