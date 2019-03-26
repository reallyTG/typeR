library(mexhaz)


### Name: fixef.mexhaz
### Title: Method for extracting fixed effects from a mexhaz object
### Aliases: fixef.mexhaz

### ** Examples


data(simdatn1)

## Fit of a mixed-effect excess hazard model, with the baseline hazard
## described by a Weibull distribution (without covariables)

Mod_weib_mix <- mexhaz(formula=Surv(time=timesurv,
event=vstat)~1, data=simdatn1, base="weibull",
expected="popmrate", verbose=0, random="clust")

fixef(Mod_weib_mix)



