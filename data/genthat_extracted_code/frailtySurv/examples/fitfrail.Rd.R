library(frailtySurv)


### Name: fitfrail
### Title: Fit a shared frailty model
### Aliases: fitfrail

### ** Examples

## Not run: 
##D # 
##D # Generate synthetic survival data with regression coefficients 
##D # beta = c(log(2),log(3)) and theta = 2, where the shared frailty 
##D # values from a gamma distribution with expectation 1 and variance theta.
##D # 
##D dat <- genfrail(N=300, K=2, beta=c(log(2),log(3)), 
##D                 frailty="gamma", theta=2,
##D                 censor.rate=0.35,
##D                 Lambda_0=function(t, tau=4.6, C=0.01) (C*t)^tau)
##D 
##D # Fit a shared frailty model
##D fit <- fitfrail(Surv(time, status) ~ Z1 + Z2 + cluster(family), 
##D                 dat, frailty="gamma")
##D fit
##D 
##D # The Lambda.fun function can give the estimated cumulative baseline hazard at
##D # any time
##D fit$Lambda.fun(seq(0, 100, by=10))
##D 
##D # Fit the DRS data, clustered on patient
##D data(drs)
##D fit.drs <- fitfrail(Surv(time, status) ~ treated + cluster(subject_id), 
##D                     drs, frailty="gamma")
##D fit.drs
## End(Not run)

# 
# A small example with c(log(2),log(3)) coefficients, Gamma(2) frailty, and
# 0.10 censorship.
# 
dat <- genfrail(N=30, K=2, beta=c(log(2),log(3)), 
                frailty="gamma", theta=2,
                censor.rate=0.10,
                Lambda_0=function(t, tau=4.6, C=0.01) (C*t)^tau)

# Fit a shared frailty model
fit <- fitfrail(Surv(time, status) ~ Z1 + Z2 + cluster(family), 
                dat, frailty="gamma", se=TRUE)
fit

# Summarize the survival curve
head(summary(fit))



