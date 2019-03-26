library(bdsmatrix)


### Name: bdsmatrix
### Title: Create a sparse symmetric block diagonal matrix object
### Aliases: bdsmatrix
### Keywords: array

### ** Examples

# The matrix shown above is created by
tmat <- bdsmatrix(c(2,3), c(1,2,1, 3,1,2, 4,3, 5),
                  rmat=matrix(c(4,6,8,1,2,7,6, 5,7,8,1,2,6,9), ncol=2))

# Note that only the lower part of the blocks is needed, however, the
#  entire block set is also allowed, i.e., c(1,2,2,1, 3,1,2,1,4,3,2,3,5)



