library(quadprog)


### Name: solve.QP.compact
### Title: Solve a Quadratic Programming Problem
### Aliases: solve.QP.compact
### Keywords: optimize

### ** Examples

##
## Assume we want to minimize: -(0 5 0) %*% b + 1/2 b^T b
## under the constraints:      A^T b >= b0
## with b0 = (-8,2,0)^T
## and      (-4  2  0) 
##      A = (-3  1 -2)
##          ( 0  0  1)
## we can use solve.QP.compact as follows:
##
Dmat       <- matrix(0,3,3)
diag(Dmat) <- 1
dvec       <- c(0,5,0)
Aind       <- rbind(c(2,2,2),c(1,1,2),c(2,2,3))
Amat       <- rbind(c(-4,2,-2),c(-3,1,1))
bvec       <- c(-8,2,0)
solve.QP.compact(Dmat,dvec,Amat,Aind,bvec=bvec)



