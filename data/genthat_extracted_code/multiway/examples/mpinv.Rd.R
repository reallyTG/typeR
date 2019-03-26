library(multiway)


### Name: mpinv
### Title: Moore-Penrose Pseudoinverse
### Aliases: mpinv
### Keywords: array algebra

### ** Examples

##########   EXAMPLE   ##########

set.seed(1)
X <- matrix(rnorm(2000),100,20)
Xi <- mpinv(X)
sum( ( X - X %*% Xi %*% X )^2 )
sum( ( Xi - Xi %*% X %*% Xi )^2 )
isSymmetric(X %*% Xi)
isSymmetric(Xi %*% X)




