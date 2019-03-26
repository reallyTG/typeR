library(imputeYn)


### Name: lss.mod
### Title: Modified Least Squares Pricnciple for Solving the AFT Model
### Aliases: lss.mod
### Keywords: least-squares

### ** Examples

# For uncorrelated datset with four covariates and 50 percent censoring 
data1<-data(n=100, p=4, r=0, b1=c(2,2,3,3), sig=1, Cper=0)
require(package="quadprog")
## Not run: 
##D fit.lss.mod<-lss.mod(cbind(data1$y, data1$delta) ~ data1$x,mcsize=500,trace=FALSE,maxiter=50,
##D  tolerance=0.01)
## End(Not run)
## Not run: fit.lss.mod

# For correlated datset with 50 percent censoring 
data2<-data(n=100, p=4, r=0.5, b1=c(2,2,3,3), sig=1, Cper=0)
## Not run: 
##D fit.lss.mod2<-lss.mod(cbind(data2$y, data2$delta) ~ data2$x, mcsize=500,trace=FALSE,
##D  maxiter=50, tolerance=0.01)
## End(Not run)
## Not run: fit.lss.mod2



