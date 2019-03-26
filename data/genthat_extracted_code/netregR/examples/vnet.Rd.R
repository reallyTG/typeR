library(netregR)


### Name: vnet
### Title: Variance computation for linear regression of network response
### Aliases: vnet vhat_exch
### Keywords: external

### ** Examples

set.seed(1)
n <- 10
d <- n*(n-1)
X <- cbind(1, rnorm(d), sample(c(0,1), d, replace=TRUE))
e <- rnorm(d)
vnet(e=e,X=X)




