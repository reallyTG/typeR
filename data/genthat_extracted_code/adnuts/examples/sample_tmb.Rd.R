library(adnuts)


### Name: sample_tmb
### Title: Bayesian inference of a TMB model using the no-U-turn sampler.
### Aliases: sample_tmb

### ** Examples

## Build a fake TMB object with objective & gradient functions and some
## other flags
f <- function(x, order=0){
  if(order != 1) # negative log density
    -sum(dnorm(x=x, mean=0, sd=1, log=TRUE))
  else x # gradient of negative log density
}
init <- function() rnorm(2)
obj <- list(env=list(DLL='demo', last.par.best=c(x=init()), f=f,
  beSilent=function() NULL))
## Run NUTS for this object
fit <- sample_tmb(obj, iter=1000, chains=3, init=init)
## Check basic diagnostics
mon <- rstan::monitor(fit$samples, print=FALSE)
Rhat <- mon[,"Rhat"]
max(Rhat)
ess <- mon[, 'n_eff']
min(ess)
## Or do it interactively with ShinyStan
## Not run: 
##D   launch_shinytmb(fit)
##D   
## End(Not run)




