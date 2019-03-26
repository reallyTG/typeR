library(quhomology)


### Name: GaussianElimination
### Title: Calculation of Gaussian Form of a matrix.
### Aliases: GaussianElimination

### ** Examples

test_mat <- matrix(c(2,4,4, -6,6,12, 10,-4,-16), nrow=3, ncol=3, byrow=TRUE)
identity_mat <- diag(3)
GaussianElimination(test_mat,identity_mat)



