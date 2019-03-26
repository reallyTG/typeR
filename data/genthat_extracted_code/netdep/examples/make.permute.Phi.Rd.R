library(netdep)


### Name: make.permute.Phi
### Title: Permutation Test of Phi
### Aliases: make.permute.Phi

### ** Examples

library(netdep)
library(igraph)
library(igraphdata)
data(UKfaculty)
A = as.matrix(get.adjacency(UKfaculty, attr= "weight", sparse = TRUE)) # weighted adjacency matrix
Y = V(UKfaculty)$Group
result = make.permute.Phi(A, Y, np = 50)





