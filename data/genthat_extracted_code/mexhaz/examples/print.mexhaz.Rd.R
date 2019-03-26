library(mexhaz)


### Name: print.mexhaz
### Title: Print method for a mexhaz object
### Aliases: print.mexhaz

### ** Examples


data(simdatn1)

## Fit of a mixed-effect excess hazard model, with the baseline hazard
## described by a Weibull distribution (without covariables)

Mod_weib_mix <- mexhaz(formula=Surv(time=timesurv,
event=vstat)~1, data=simdatn1, base="weibull",
expected="popmrate", verbose=0, random="clust")

print(Mod_weib_mix)



