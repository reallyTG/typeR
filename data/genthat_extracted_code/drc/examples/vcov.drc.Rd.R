library(drc)


### Name: vcov.drc
### Title: Calculating variance-covariance matrix for objects of class
###   'drc'
### Aliases: vcov.drc
### Keywords: models nonlinear

### ** Examples


## Fitting a four-parameter log-logistic model
ryegrass.m1 <- drm(rootl ~ conc, data = ryegrass, fct = LL.4())
vcov(ryegrass.m1)
vcov(ryegrass.m1, corr = TRUE)




