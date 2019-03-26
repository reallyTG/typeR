library(slam)


### Name: abind
### Title: Combine Sparse Arrays
### Aliases: abind_simple_sparse_array extend_simple_sparse_array
### Keywords: array

### ** Examples

## automatic
abind_simple_sparse_array(1:3, array(4:6, c(1,3)))
abind_simple_sparse_array(1:3, array(4:6, c(3,1)), MARGIN = 2L)

## manual
abind_simple_sparse_array(1:3, 4:6)
abind_simple_sparse_array(1:3, 4:6, MARGIN = -2L)   ## by columns
abind_simple_sparse_array(1:3, 4:6, MARGIN = -1L)   ## by rows

##
a <- as.simple_sparse_array(1:3)
a
extend_simple_sparse_array(a, c( 0L, 1L))
extend_simple_sparse_array(a, c(-1L,-2L))   ## the same
extend_simple_sparse_array(a, c( 1L, 1L))



