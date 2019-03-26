library(mexhaz)


### Name: plot.predMexhaz
### Title: Plot method for a predMexhaz object
### Aliases: plot.predMexhaz

### ** Examples


data(simdatn1)

## Fit of a fixed-effect hazard model, with the baseline hazard
## described by a linear B-spline with two knots at 1 and 5 year and with
## effects of age (agecr), deprivation index (depindex) and sex (IsexH)

Mod_bs2_2 <- mexhaz(formula=Surv(time=timesurv,
event=vstat)~agecr+depindex+IsexH, data=simdatn1, base="exp.bs",
degree=2, knots=c(1,5), verbose=0)

## Prediction at several time points for one vector of covariates
Pred_Modbs2_2A <- predict(Mod_bs2_2, time.pts=seq(0,10,by=0.1),
data.val=data.frame(agecr=0,depindex=0.5,IsexH=1))

plot(Pred_Modbs2_2A, which="hazard")




