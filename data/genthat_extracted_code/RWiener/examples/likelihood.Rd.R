library(RWiener)


### Name: likelihood
### Title: Likelihood and criterion functions for wdm
### Aliases: logLik.wdm deviance.wdm AIC.wdm BIC.wdm
### Keywords: logLik.wdm deviance.wdm AIC.wdm BIC.wdm

### ** Examples

## generate random data
dat <- rwiener(100,3,.25,.5,0.8)

## fit wdm
wdm1 <- wdm(dat, alpha=3, tau=.25, beta=0.5)

## compute likelihood, AIC, BIC, deviance
logLik(wdm1)
AIC(wdm1)
BIC(wdm1)
deviance(wdm1)

## Not run: 
##D ## estimate parameters by calling optim manually
##D ## first define necessary wrapper function
##D nll <- function(x, data) { 
##D   object <- wdm(data, alpha=x[1], tau=x[2], beta=x[3], delta=x[4])
##D   -logLik(object)
##D }
##D ## call estimation routine
##D onm <- optim(c(1,.1,.1,1),nll,data=dat, method="Nelder-Mead")
##D est <- optim(onm$par,nll,data=dat, method="BFGS",hessian=TRUE)
##D est$par # parameter estimates
##D ## use the obtained parameter estimates to create wdm object
##D wdm2 <- wdm(dat, alpha=est$par[1], tau=est$par[2], beta=est$par[3],
##D   delta=est$par[4])
##D ## now the generic functions can be used again
##D logLik(wdm2)
## End(Not run)



