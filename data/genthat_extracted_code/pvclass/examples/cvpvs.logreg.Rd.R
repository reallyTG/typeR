library(pvclass)


### Name: cvpvs.logreg
### Title: Cross-Validated P-Values (Penalized Multicategory Logistic
###   Regression)
### Aliases: cvpvs.logreg
### Keywords: classif

### ** Examples

## Not run: 
##D X <- iris[, 1:4]
##D Y <- iris[, 5]
##D 
##D cvpvs.logreg(X, Y, tau.o=1, pen.method="vectors",progress=TRUE)
## End(Not run)

# A bigger data example: Buerk's hospital data.
## Not run: 
##D data(buerk)
##D X.raw <- as.matrix(buerk[,1:21])
##D Y.raw <- buerk[,22]
##D n0.raw <- sum(1 - Y.raw)
##D n1 <- sum(Y.raw)
##D n0 <- 3*n1
##D 
##D X0 <- X.raw[Y.raw==0,]
##D X1 <- X.raw[Y.raw==1,]
##D 
##D tmpi0 <- sample(1:n0.raw,size=n0,replace=FALSE)
##D tmpi1 <- sample(1:n1    ,size=n1,replace=FALSE)
##D 
##D X <- rbind(X0[tmpi0,],X1)
##D Y <- c(rep(1,n0),rep(2,n1))
##D 
##D str(X)
##D str(Y)
##D 
##D PV <- cvpvs.logreg(X,Y,
##D 	tau.o=5,pen.method="v",progress=TRUE)
##D 
##D analyze.pvs(Y=Y,pv=PV,pvplot=FALSE)
## End(Not run)




