library(LowRankQP)


### Name: LowRankQP
### Title: Solve Low Rank Quadratic Programming Problems
### Aliases: LowRankQP
### Keywords: optimize

### ** Examples

library(LowRankQP)

# Assume we want to minimize: (0 -5 0 0 0 0) %*% alpha + 1/2 alpha[1:3]^T alpha[1:3]
# under the constraints:      A^T alpha = b
# with b = (-8,  2,  0 )^T
# and      (-4   2   0 ) 
#      A = (-3   1  -2 )
#          ( 0   0   1 )
#          (-1   0   0 )
#          ( 0  -1   0 )
#          ( 0   0  -1 )
#  alpha >= 0
#
# (Same example as used in quadprog)
#
# we can use LowRankQP as follows:

Vmat          <- matrix(0,6,6)
diag(Vmat)    <- c(1, 1,1,0,0,0)
dvec          <- c(0,-5,0,0,0,0)
Amat          <- matrix(c(-4,-3,0,-1,0,0,2,1,0,0,-1,0,0,-2,1,0,0,-1),6,3)
bvec          <- c(-8,2,0)
uvec          <- c(100,100,100,100,100,100)
LowRankQP(Vmat,dvec,t(Amat),bvec,uvec,method="CHOL")

# Now solve the same problem except use low-rank V

Vmat          <- matrix(c(1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0),6,3)
dvec          <- c(0,-5,0,0,0,0)
Amat          <- matrix(c(-4,-3,0,-1,0,0,2,1,0,0,-1,0,0,-2,1,0,0,-1),6,3)
bvec          <- c(-8,2,0)
uvec          <- c(100,100,100,100,100,100)
LowRankQP(Vmat,dvec,t(Amat),bvec,uvec,method="SMW")




