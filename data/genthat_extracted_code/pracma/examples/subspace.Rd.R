library(pracma)


### Name: subspace
### Title: Angle between two subspaces
### Aliases: subspace
### Keywords: array

### ** Examples

180 * subspace(c(1, 2), c(2, 1)) / pi  #=> 36.87
180 * subspace(c(0, 1), c(1, 2)) / pi  #=> 26.565

H <- 
hadamard(8)
A <- H[, 2:4]
B <- H[, 5:8]
subspace(A, B)    #=> 1.5708 or pi/2, i.e. A and B are orthogonal



