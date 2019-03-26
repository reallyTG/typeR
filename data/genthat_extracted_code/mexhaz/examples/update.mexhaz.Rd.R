library(mexhaz)


### Name: update.mexhaz
### Title: Update of a mexhaz model
### Aliases: update.mexhaz

### ** Examples


data(simdatn1)

## Fit of a mixed-effect excess hazard model, with the baseline hazard
## described by a Weibull distribution (without covariables)

Mod_weib <- mexhaz(formula=Surv(time=timesurv,
event=vstat)~1, data=simdatn1, base="weibull", verbose=0)

## Add an effect of gender
Mod_weib_2 <- update(Mod_weib, formula=~.+IsexH)




