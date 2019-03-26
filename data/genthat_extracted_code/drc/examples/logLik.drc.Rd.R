library(drc)


### Name: logLik.drc
### Title: Extracting the log likelihood
### Aliases: logLik.drc
### Keywords: models nonlinear

### ** Examples


## Fitting a four-parameter log-logistic model
ryegrass.m1 <- drm(rootl ~conc, data = ryegrass, fct = LL.4()) 
logLik(ryegrass.m1)




