library(frailtySurv)


### Name: plot.simfrail
### Title: Plot method for 'simfrail' objects
### Aliases: plot.simfrail

### ** Examples

## Not run: 
##D set.seed(2015)
##D sim <- simfrail(1000,
##D     genfrail.args=alist(beta=c(log(2),log(3)), frailty="gamma", 
##D                         censor.rate=0.30, N=300, K=2, theta=2,
##D                         covar.distr="uniform", covar.param=c(0, 1),
##D                         Lambda_0=function(t, tau=4.6, C=0.01) (C*t)^tau), 
##D     fitfrail.args=alist(formula=Surv(time, status) ~ Z1 + Z2 
##D                                                    + cluster(family), 
##D                         frailty="gamma"),
##D     Lambda.times=1:120)
##D 
##D # Make a boxplot of residuals
##D plot(sim, type="residuals")
##D 
##D # Plot the mean estimated cumulative baseline hazard and empirical 0.95 CI
##D plot(sim, type="cumhaz")
## End(Not run)



