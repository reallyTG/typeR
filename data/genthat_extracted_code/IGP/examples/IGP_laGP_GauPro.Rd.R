library(IGP)


### Name: IGP_laGP_GauPro
### Title: IGP R6 object for fitting laGP_GauPro model
### Aliases: IGP_laGP_GauPro
### Keywords: Gaussian data, kriging, process, regression

### ** Examples

## Not run: 
##D n <- 40
##D d <- 2
##D n2 <- 20
##D f1 <- function(x) {sin(2*pi*x[1]) + sin(2*pi*x[2])}
##D X1 <- matrix(runif(n*d),n,d)
##D Z1 <- apply(X1,1,f1) + rnorm(n, 0, 1e-3)
##D X2 <- matrix(runif(n2*d),n2,d)
##D Z2 <- apply(X2,1,f1)
##D XX1 <- matrix(runif(10),5,2)
##D ZZ1 <- apply(XX1, 1, f1)
##D u <- IGP_sklearn$new(X=X1,Z=Z1)
##D cbind(u$predict(XX1), ZZ1)
##D u$predict.se(XX1)
##D u$update(Xnew=X2,Znew=Z2)
##D u$predict(XX1)
##D u$delete()
## End(Not run)



