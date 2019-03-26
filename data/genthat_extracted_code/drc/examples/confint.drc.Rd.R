library(drc)


### Name: confint.drc
### Title: Confidence Intervals for model parameters
### Aliases: confint.drc
### Keywords: models nonlinear

### ** Examples


## Fitting a four-parameter log-logistic model
ryegrass.m1 <- drm(rootl ~ conc, data = ryegrass, fct = LL.4())

## Confidence intervals for all parameters
confint(ryegrass.m1)

## Confidence interval for a single parameter
confint(ryegrass.m1, "e")




