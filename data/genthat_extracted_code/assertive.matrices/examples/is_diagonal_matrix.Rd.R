library(assertive.matrices)


### Name: assert_is_diagonal_matrix
### Title: Is the input a diagonal matrix?
### Aliases: assert_is_diagonal_matrix is_diagonal_matrix

### ** Examples

x <- diag(3)
is_diagonal_matrix(x)
x[1, 2] <- 100 * .Machine$double.eps
is_diagonal_matrix(x)
x[2, 3] <- 101 * .Machine$double.eps
is_diagonal_matrix(x)



