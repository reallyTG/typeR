library(assertive.matrices)


### Name: assert_is_zero_matrix
### Title: Is the input a zero matrix
### Aliases: assert_is_zero_matrix is_zero_matrix

### ** Examples

x <- matrix(numeric(9), 3)
is_zero_matrix(x)
x[1, 1] <- 100 * .Machine$double.eps
is_zero_matrix(x)
x[2, 2] <- 101 * .Machine$double.eps
is_zero_matrix(x)



