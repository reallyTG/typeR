library(fda)


### Name: as.array3
### Title: Reshape a vector or array to have 3 dimensions.
### Aliases: as.array3 as.array3
### Keywords: utilities

### ** Examples

##
## vector -> array 
##
as.array3(c(a=1, b=2)) 

##
## matrix -> array 
##
as.array3(matrix(1:6, 2))
as.array3(matrix(1:6, 2, dimnames=list(letters[1:2], LETTERS[3:5]))) 

##
## array -> array 
##
as.array3(array(1:6, 1:3)) 

##
## 4-d array 
##
## Not run: 
##D as.array3(array(1:24, 1:4)) 
##D Error in as.array3(array(1:24, 1:4)) : 
##D   length(dim(array(1:24, 1:4)) = 4 > 3
## End(Not run)



