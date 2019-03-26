library(slam)


### Name: simple_sparse_array
### Title: Simple Sparse Arrays
### Aliases: simple_sparse_array simple_sparse_zero_array
###   as.simple_sparse_array is.simple_sparse_array
###   simplify_simple_sparse_array reduce_simple_sparse_array
###   drop_simple_sparse_array
### Keywords: math

### ** Examples

x <- array(c(1, 0, 0, 2, 0, 0, 0, 3), dim = c(2, 2, 2))
s <- as.simple_sparse_array(x)
identical(x, as.array(s))

simple_sparse_array(matrix(c(1, 3, 1, 3, 1, 3), nrow = 2), c(1, 2))



