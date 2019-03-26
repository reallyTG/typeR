library(OjaNP)


### Name: hyperplane
### Title: Hyperplane Passing Through k Points in the k-dimensional Space.
### Aliases: hyperplane
### Keywords: multivariate nonparametric

### ** Examples

### ----<< Example 1 >>---- : line in R^2
X <- rbind(c(4,5),c(8,2))
hyperplane(X)
# The line through the the points c(4,5) and c(8,2) is given by 
#    3*x + 4*y - 32 = 0.
# The norm of the first two components of the return value 
# of hyperplane() (i.e. the vector d above) equals the 
# distance of both points.

X <- rbind(c(8,2),c(4,5))
hyperplane(X)
# If the order of the points is changed, the direction of d 
# (see details) may also change.



### ----<< Example 2 >>---- : unit vectors in R^3
X <- diag(rep(1,3))
hyperplane(X)
# The plane passing through all three unit vectors is given by 
#   -x - y - z + 1 = 0.
# These three points form a equilateral triangle on the plane 
# with side length sqrt(2) and hence area sqrt(3)/2.
# The norm of d (see details) equals twice this number. 



