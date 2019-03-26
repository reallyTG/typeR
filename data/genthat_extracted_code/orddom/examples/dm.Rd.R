library(orddom)


### Name: dm
### Title: Dominance or Difference Matrix Creation
### Aliases: dm
### Keywords: array

### ** Examples
## Not run: 
##D > x<-t(matrix(c(1,1,2,2,2,3,3,3,4,5),1))
##D > y<-t(matrix(c(1,2,3,4,4,5),1))
##D > dm(x,y,diff=TRUE)
##D   1  2  3  4  4  5
##D 1 0 -1 -2 -3 -3 -4
##D 1 0 -1 -2 -3 -3 -4
##D 2 1  0 -1 -2 -2 -3
##D 2 1  0 -1 -2 -2 -3
##D 2 1  0 -1 -2 -2 -3
##D 3 2  1  0 -1 -1 -2
##D 3 2  1  0 -1 -1 -2
##D 3 2  1  0 -1 -1 -2
##D 4 3  2  1  0  0 -1
##D 5 4  3  2  1  1  0
##D > dm(x,y)
##D   1  2  3  4  4  5
##D 1 0 -1 -1 -1 -1 -1
##D 1 0 -1 -1 -1 -1 -1
##D 2 1  0 -1 -1 -1 -1
##D 2 1  0 -1 -1 -1 -1
##D 2 1  0 -1 -1 -1 -1
##D 3 1  1  0 -1 -1 -1
##D 3 1  1  0 -1 -1 -1
##D 3 1  1  0 -1 -1 -1
##D 4 1  1  1  0  0 -1
##D 5 1  1  1  1  1  0
## End(Not run)


