library(netregR)


### Name: lmnet
### Title: Linear regression for network response
### Aliases: lmnet
### Keywords: external

### ** Examples

set.seed(1)
n <- 10
d <- n*(n-1)
X <- cbind(1, rnorm(d), sample(c(0,1), d, replace=TRUE))
betatrue <- rep(1,3)
Y <- X %*% betatrue + rnorm(d)
fit <- lmnet(Y,X)
fit
fit2 <- lmnet(Y,X,reweight=TRUE)
fit2




