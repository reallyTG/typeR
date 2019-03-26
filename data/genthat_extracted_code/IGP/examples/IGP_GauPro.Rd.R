library(IGP)


### Name: IGP_GauPro
### Title: IGP R6 object for fitting GauPro model
### Aliases: IGP_GauPro
### Keywords: Gaussian data, kriging, process, regression

### ** Examples

n <- 40
d <- 2
n2 <- 20
f1 <- function(x) {sin(2*pi*x[1]) + sin(2*pi*x[2])}
X1 <- matrix(runif(n*d),n,d)
Z1 <- apply(X1,1,f1) + rnorm(n, 0, 1e-3)
X2 <- matrix(runif(n2*d),n2,d)
Z2 <- apply(X2,1,f1)
XX1 <- matrix(runif(10),5,2)
ZZ1 <- apply(XX1, 1, f1)
u <- IGP_GauPro$new(X=X1,Z=Z1, parallel=FALSE)
cbind(u$predict(XX1), ZZ1)
u$predict.se(XX1)
u$update(Xnew=X2,Znew=Z2)
u$predict(XX1)
u$delete()



