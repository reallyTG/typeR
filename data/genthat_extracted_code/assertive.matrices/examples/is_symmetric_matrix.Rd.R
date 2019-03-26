library(assertive.matrices)


### Name: assert_is_symmetric_matrix
### Title: Is the input a symmetric matrix?
### Aliases: assert_is_symmetric_matrix is_symmetric_matrix

### ** Examples

m <- diag(3); m[3, 1] <- 1e-100
assert_is_symmetric_matrix(m)
#These examples should fail.
assertive.base::dont_stop(assert_is_symmetric_matrix(m, tol = 0))



