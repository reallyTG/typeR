library(lpSolve)


### Name: lp.transport
### Title: Integer Programming for the Transportation Problem
### Aliases: lp.transport
### Keywords: optimize

### ** Examples

#
# Transportation problem, Bronson, problem 9.1, p. 86
#
# Set up cost matrix
#
costs <- matrix (10000, 8, 5); costs[4,1] <- costs[-4,5] <- 0
costs[1,2] <- costs[2,3] <- costs[3,4] <- 7; costs[1,3] <- costs[2,4] <- 7.7
costs[5,1] <- costs[7,3] <- 8; costs[1,4] <- 8.4; costs[6,2] <- 9
costs[8,4] <- 10; costs[4,2:4] <- c(.7, 1.4, 2.1)
#
# Set up constraint signs and right-hand sides.
#
row.signs <- rep ("<", 8)
row.rhs <- c(200, 300, 350, 200, 100, 50, 100, 150)
col.signs <- rep (">", 5)
col.rhs <- c(250, 100, 400, 500, 200)
#
# Run
#
lp.transport (costs, "min", row.signs, row.rhs, col.signs, col.rhs)
## Not run: Success: the objective function is 7790
lp.transport (costs, "min", row.signs, row.rhs, col.signs, col.rhs)$solution
## Not run: 
##D      [,1] [,2] [,3] [,4] [,5]
##D [1,]    0  100    0  100    0
##D [2,]    0    0  300    0    0
##D [3,]    0    0    0  350    0
##D [4,]  200    0    0    0    0
##D [5,]   50    0    0    0   50
##D [6,]    0    0    0    0   50
##D [7,]    0    0  100    0    0
##D [8,]    0    0    0   50  100
## End(Not run)



