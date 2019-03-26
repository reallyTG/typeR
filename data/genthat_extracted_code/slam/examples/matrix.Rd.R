library(slam)


### Name: simple_triplet_matrix
### Title: Simple Triplet Matrix
### Aliases: simple_triplet_matrix simple_triplet_zero_matrix
###   simple_triplet_diag_matrix as.simple_triplet_matrix
###   is.simple_triplet_matrix
### Keywords: math

### ** Examples

x <- matrix(c(1, 0, 0, 2), nrow = 2)
s <- as.simple_triplet_matrix(x)
identical(x, as.matrix(s))

simple_triplet_matrix(c(1, 4), c(1, 2), c(1, 2))
simple_triplet_zero_matrix(3)
simple_triplet_diag_matrix(1:3)

cbind(rbind(s, t(s)), rbind(s, s))
## Not run: 
##D ## map to default Matrix class
##D stopifnot(require("Matrix"))
##D sparseMatrix(i = s$i, j = s$j, x = s$v, dims = dim(s), 
##D 	     dimnames = dimnames(s))
## End(Not run)



