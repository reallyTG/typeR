library(HelpersMG)


### Name: SEfromHessian
### Title: Standard error of parameters based on Hessian matrix
### Aliases: SEfromHessian

### ** Examples

## Not run: 
##D val=rnorm(100, mean=20, sd=5)
##D # Return -ln L of values in val in Gaussian distribution with mean and sd in par
##D fitnorm<-function(par, val) {
##D   -sum(dnorm(val, par["mean"], par["sd"], log = TRUE))
##D }
##D # Initial values for search
##D p<-c(mean=20, sd=5)
##D # fit the model
##D result <- optim(par=p, fn=fitnorm, val=val, method="BFGS", hessian=TRUE)
##D SE <- SEfromHessian(result$hessian)
##D library(MASS)
##D fitdistr(val, densfun = "normal")
## End(Not run)



