library(mexhaz)


### Name: print.summary.mexhaz
### Title: Printing method for a summary.mexhaz object
### Aliases: print.summary.mexhaz

### ** Examples


data(simdatn1)

## Fit of a mixed-effect excess hazard model, with the baseline hazard
## described by a Weibull distribution (without covariables)

Mod_weib <- mexhaz(formula=Surv(time=timesurv,
event=vstat)~1, data=simdatn1, base="weibull", verbose=0)

summary(Mod_weib)



