library(multiway)


### Name: fnnls
### Title: Fast Non-Negative Least Squares
### Aliases: fnnls
### Keywords: optimize

### ** Examples

##########   EXAMPLE 1   ##########
X <- matrix(1:100,50,2)
y <- matrix(101:150,50,1)
beta <- solve(crossprod(X))%*%crossprod(X,y)
beta
beta <- fnnls(crossprod(X),crossprod(X,y))
beta


##########   EXAMPLE 2   ##########
X <- cbind(-(1:50),51:100)
y <- matrix(101:150,50,1)
beta <- solve(crossprod(X))%*%crossprod(X,y)
beta
beta <- fnnls(crossprod(X),crossprod(X,y))
beta


##########   EXAMPLE 3   ##########
X <- matrix(rnorm(400),100,4)
btrue <- c(1,2,0,7)
y <- X%*%btrue + rnorm(100)
fnnls(crossprod(X),crossprod(X,y))


##########   EXAMPLE 4   ##########
X <- matrix(rnorm(2000),100,20)
btrue <- runif(20)
y <- X%*%btrue + rnorm(100)
beta <- fnnls(crossprod(X),crossprod(X,y))
crossprod(btrue-beta)/20




