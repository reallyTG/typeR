library(netregR)


### Name: inputs_lmnet
### Title: Input preprocessing
### Aliases: inputs_lmnet
### Keywords: external

### ** Examples

# tmax = 1
set.seed(1)
n <- 10
Xlist <- list(matrix(rnorm(n^2),n,n), matrix(sample(c(0,1), n^2, replace=TRUE),n,n))
Xlist$Y <- matrix(rnorm(n^2), n, n)
Xlist$Y[1:5] <- NA
r <- inputs_lmnet(Xlist)
r
lmnet(r$Y,r$X,nodes=r$nodes)

# tmax = 4
set.seed(1)
n <- 10
tmax <- 4
X1 <- array(rnorm(n^2*tmax),c(n,n,tmax))
X2 <- array(sample(c(0,1), n^2*tmax, replace=TRUE), c(n,n,tmax))
Xlist <- list(X1, X2)
Xlist$Y <- array(rnorm(n^2)*tmax, c(n, n, tmax))
Xlist$Y[1:5] <- NA
r <- inputs_lmnet(Xlist)
head(r$nodes)




