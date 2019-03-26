library(reticulate)


### Name: array_reshape
### Title: Reshape an Array
### Aliases: array_reshape

### ** Examples

## Not run: 
##D # let's construct a 2x2 array from a vector of 4 elements
##D x <- 1:4
##D 
##D # rearrange will fill the array row-wise
##D array_reshape(x, c(2, 2))
##D #      [,1] [,2]
##D # [1,]    1    2
##D # [2,]    3    4
##D # setting the dimensions 'fills' the array col-wise
##D dim(x) <- c(2, 2)
##D x
##D #      [,1] [,2]
##D # [1,]    1    3
##D # [2,]    2    4
## End(Not run)



