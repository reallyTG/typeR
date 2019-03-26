library(dirmult)


### Name: equalTheta
### Title: Test whether theta is equal for several tables
### Aliases: equalTheta

### ** Examples

## Not run: 
##D data(us)
##D fit <- lapply(us[1:2],dirmult,epsilon=10^(-12),trace=FALSE)
##D thetas <- unlist(lapply(fit,function(x) x$theta))
##D logliks <- unlist(lapply(fit,function(x) x$loglik))
##D fit1 <- equalTheta(us[c(1:2)],theta=mean(thetas),epsilon=10^(-12))
##D lr <- -2*(fit1$loglik-sum(logliks))
##D 1-pchisq(lr,df=1)
##D fit1$theta[[1]]
## End(Not run)


