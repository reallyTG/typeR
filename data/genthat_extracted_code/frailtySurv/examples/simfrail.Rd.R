library(frailtySurv)


### Name: simfrail
### Title: Simulate survival data and fit models
### Aliases: simfrail
### Keywords: survival simulation

### ** Examples

## Not run: 
##D sim <- simfrail(reps=100,
##D                 genfrail.args=alist(
##D                   N=50, K=2,
##D                   beta=c(log(2),log(3)), 
##D                   frailty="gamma", theta=2,
##D                   Lambda_0 = function(t, tau=4.6, C=0.01) (C*t)^tau), 
##D                 fitfrail.args=alist(
##D                   formula=Surv(time, status) ~ Z1 + Z2 + cluster(family), 
##D                   frailty="gamma"),
##D                 Lambda.times=1:120, cores = 0)
##D 
##D # Summarize the results
##D summary(sim)
##D 
##D # Plot the residuals
##D plot(sim, "residuals")
## End(Not run)



