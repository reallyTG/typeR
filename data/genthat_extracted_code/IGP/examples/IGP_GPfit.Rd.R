library(IGP)


### Name: IGP_GPfit
### Title: IGP R6 object for fitting GPfit model
### Aliases: IGP_GPfit
### Keywords: Gaussian data, kriging, process, regression

### ** Examples

n <- 20
d <- 2
n2 <- 20
f1 <- function(x) {sin(2*pi*x[1]) + sin(2*pi*x[2])}
X1 <- matrix(runif(n*d),n,d)
Z1 <- apply(X1,1,f1) + rnorm(n, 0, 1e-3)
X2 <- matrix(runif(n2*d),n2,d)
Z2 <- apply(X2,1,f1)
XX1 <- matrix(runif(10),5,2)
ZZ1 <- apply(XX1, 1, f1)
u <- IGP_GPfit$new(X=X1,Z=Z1)
cbind(u$predict(XX1), ZZ1)
u$predict.se(XX1)
u$update(Xnew=X2,Znew=Z2)
u$predict(XX1)
u$delete()



