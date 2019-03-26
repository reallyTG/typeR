library(assertive.matrices)


### Name: assert_is_lower_triangular_matrix
### Title: Is the matrix upper/lower triangular?
### Aliases: assert_is_lower_triangular_matrix
###   assert_is_upper_triangular_matrix is_lower_triangular_matrix
###   is_upper_triangular_matrix

### ** Examples

x <- matrix(c(1, 2, 3, 0, 5, 6, 0, 0, 9), nrow = 3)
is_lower_triangular_matrix(x)
is_lower_triangular_matrix(x, strictly = TRUE)
is_upper_triangular_matrix(t(x))
is_upper_triangular_matrix(t(x), strictly = TRUE)
x[1, 2] <- 100 * .Machine$double.eps
is_lower_triangular_matrix(x)
x[2, 3] <- 101 * .Machine$double.eps
is_lower_triangular_matrix(x)



