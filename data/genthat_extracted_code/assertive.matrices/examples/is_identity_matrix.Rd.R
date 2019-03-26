library(assertive.matrices)


### Name: assert_is_identity_matrix
### Title: Is the matrix an identity matrix?
### Aliases: assert_is_identity_matrix is_identity_matrix

### ** Examples

x <- diag(3)
is_identity_matrix(x)
x[1, 2] <- 100 * .Machine$double.eps
is_identity_matrix(x)
x[2, 3] <- 101 * .Machine$double.eps
is_identity_matrix(x)



