library(grpSLOPE)


### Name: proximalGradientSolverGroupSLOPE
### Title: Proximal gradient method for Group SLOPE
### Aliases: proximalGradientSolverGroupSLOPE

### ** Examples

set.seed(1)
A   <- matrix(runif(100, 0, 1), 10, 10)
grp <- c(0, 0, 1, 1, 2, 2, 2, 2, 2, 3)
wt  <- c(2, 2, 2, 2, 5, 5, 5, 5, 5, 1)
x   <- c(0, 0, 5, 1, 0, 0, 0, 1, 0, 3)
y   <- A %*% x
lam <- 0.1 * (10:7)
result <- proximalGradientSolverGroupSLOPE(y=y, A=A, group=grp, wt=wt, lambda=lam, verbose=FALSE)
result$x
#           [,1]
#  [1,] 0.000000
#  [2,] 0.000000
#  [3,] 3.856005
#  [4,] 2.080736
#  [5,] 0.000000
#  [6,] 0.000000
#  [7,] 0.000000
#  [8,] 0.000000
#  [9,] 0.000000
# [10,] 3.512833




