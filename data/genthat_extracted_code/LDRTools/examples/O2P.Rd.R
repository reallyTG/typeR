library(LDRTools)


### Name: O2P
### Title: Function to Compute an Orthogonal Projection Matrix Based on a
###   Matrix with Orthonormal Columns
### Aliases: O2P
### Keywords: multivariate

### ** Examples

X <- tcrossprod(matrix(rnorm(100),ncol=10))
# Orthogonal projector based on the first three eigenvectors of X
P <- O2P(eigen(X)$vectors[,1:3])



