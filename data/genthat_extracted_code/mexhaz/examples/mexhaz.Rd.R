library(mexhaz)


### Name: mexhaz
### Title: mexhaz function
### Aliases: mexhaz

### ** Examples


data(simdatn1)

## Fit of a mixed-effect excess hazard model, with the baseline hazard
## described by a Weibull distribution (without covariables)

Mod_weib_mix <- mexhaz(formula=Surv(time=timesurv,
event=vstat)~1, data=simdatn1, base="weibull",
expected="popmrate", verbose=0, random="clust")


## More complex examples (not run)

## Fit of a mixed-effect excess hazard model, with the baseline hazard
## described by a cubic B-spline with two knots at 1 and 5 year and with
## effects of age (agecr), deprivation index (depindex) and sex (IsexH)

# Mod_bs3_2mix_nph <- mexhaz(formula=Surv(time=timesurv,
# event=vstat)~agecr+depindex+IsexH+nph(agecr), data=simdatn1,
# base="exp.bs", degree=3, knots=c(1,5), expected="popmrate",
# random="clust", verbose=1000)

## Fit of a mixed-effect excess hazard model, with the baseline hazard
## described by a restricted cubic spline with two knots at the
## tertiles of the distribution of follow-up times for individuals who
## presented the event and with effects of age (agecr) and sex (IsexH)

# Mod_ns3_2mix_nph <- mexhaz(formula=Surv(time=timesurv,
# event=vstat)~agecr+nph(agecr), data=simdatn1, base="exp.ns", degree=3,
# knots=quantile(simdatn1[simdatn1$vstat==1,]$timesurv, probs=c(1:2/3)),
# expected="popmrate", random="clust", verbose=1000)




