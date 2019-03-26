library(lpSolve)


### Name: lp.assign
### Title: Integer Programming for the Assignment Problem
### Aliases: lp.assign
### Keywords: optimize

### ** Examples

assign.costs <- matrix (c(2, 7, 7, 2, 7, 7, 3, 2, 7, 2, 8, 10, 1, 9, 8, 2), 4, 4)
## Not run: 
##D > assign.costs
##D      [,1] [,2] [,3] [,4]
##D [1,]    2    7    7    1
##D [2,]    7    7    2    9
##D [3,]    7    3    8    8
##D [4,]    2    2   10    2
## End(Not run)
lp.assign (assign.costs)
## Not run: Success: the objective function is 8
lp.assign (assign.costs)$solution
## Not run: 
##D      [,1] [,2] [,3] [,4]
##D [1,]    0    0    0    1
##D [2,]    0    0    1    0
##D [3,]    0    1    0    0
##D [4,]    1    0    0    0
## End(Not run)



