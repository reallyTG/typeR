library(matlab)


### Name: fliplr
### Title: MATLAB matrix flip functions
### Aliases: fliplr fliplr,ANY-method fliplr,array-method
###   fliplr,matrix-method fliplr,missing-method fliplr,vector-method
###   flipud flipud,ANY-method flipud,array-method flipud,matrix-method
###   flipud,missing-method flipud,vector-method
### Keywords: array

### ** Examples

fliplr(1:9)
flipud(1:9)	# same as previous since vectors have no orientation in R
fliplr(matrix(1:9, 3, 3, byrow=TRUE))
flipud(matrix(1:9, 3, 3, byrow=TRUE))



