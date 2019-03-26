library(coxed)


### Name: sim.survdata
### Title: Simulating duration data for the Cox proportional hazards model
### Aliases: sim.survdata

### ** Examples

simdata <- sim.survdata(N=1000, T=100, num.data.frames=2)
require(survival)
data <- simdata[[1]]$data
model <- coxph(Surv(y, failed) ~ X1 + X2 + X3, data=data)
model$coefficients ## model-estimated coefficients
simdata[[1]]$betas ## "true" coefficients

## User-specified baseline hazard
my.hazard <- function(t){ #lognormal with mean of 50, sd of 10
dnorm((log(t) - log(50))/log(10)) /
     (log(10)*t*(1 - pnorm((log(t) - log(50))/log(10))))
}
simdata <- sim.survdata(N=1000, T=100, hazard.fun = my.hazard)

## A simulated data set with time-varying covariates
## Not run: 
##D simdata <- sim.survdata(N=1000, T=100, type="tvc", xvars=5, num.data.frames=1)
##D summary(simdata$data)
##D model <- coxph(Surv(start, end, failed) ~ X1 + X2 + X3 + X4 + X5, data=simdata$data)
##D model$coefficients ## model-estimated coefficients
##D simdata$betas ## "true" coefficients
## End(Not run)

## A simulated data set with time-varying coefficients
simdata <- sim.survdata(N=1000, T=100, type="tvbeta", num.data.frames = 1)
simdata$betas



