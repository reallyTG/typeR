library(frailtySurv)


### Name: vcov.fitfrail
### Title: Compute variance/covariance matrix for fitfrail model
### Aliases: vcov.fitfrail

### ** Examples

## Not run: 
##D dat <- genfrail(N=200, K=2, beta=c(log(2),log(3)), 
##D                 frailty="gamma", theta=2,
##D                 censor.rate=0.35,
##D                 Lambda_0=function(t, tau=4.6, C=0.01) (C*t)^tau)
##D 
##D fit <- fitfrail(Surv(time, status) ~ Z1 + Z2 + cluster(family), 
##D                 dat, frailty="gamma")
##D 
##D # boot=TRUE will give the weighted bootstrap variance estimates
##D COV <- vcov(fit, boot=FALSE)
##D COV
## End(Not run)



