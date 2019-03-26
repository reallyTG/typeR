library(slam)


### Name: rollup
### Title: Rollup Sparse Arrays
### Aliases: rollup rollup.array rollup.matrix rollup.simple_triplet_matrix
###   rollup.simple_sparse_array
### Keywords: array algebra arith

### ** Examples

##
x <- matrix(c(1, 0, 0, 2, 1, NA), nrow = 2, 
	    dimnames = list(A = 1:2, B = 1:3))
x
apply(x, 1L, sum, na.rm = TRUE)
##
rollup(x, 2L, na.rm = TRUE)
##
rollup(x, 2L, c(1,2,1), na.rm = TRUE)
## omit
rollup(x, 2L, c(1,NA,1), na.rm = TRUE)
## expand
a <- as.simple_sparse_array(x)
a
r <- rollup(a, 1L, FUN = mean, na.rm = TRUE, EXPAND = "dense")
as.array(r)
## 
r <- rollup(a, 1L, FUN = function(x, nz) 
	length(x) / (length(x) + nz), 
    EXPAND = "sparse"
)
as.array(r)



