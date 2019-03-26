library(slam)


### Name: crossprod
### Title: Matrix Crossproduct
### Aliases: tcrossprod_simple_triplet_matrix
###   crossprod_simple_triplet_matrix matprod_simple_triplet_matrix
### Keywords: algebra array

### ** Examples

## 
x <- matrix(c(1, 0, 0, 2, 1, 0), nrow = 3)
x
s <- as.simple_triplet_matrix(x)
tcrossprod_simple_triplet_matrix(s, x)
##
tcrossprod_simple_triplet_matrix(s)
##
tcrossprod_simple_triplet_matrix(s[1L, ], s[2:3, ])



