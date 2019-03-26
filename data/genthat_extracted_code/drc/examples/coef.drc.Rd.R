library(drc)


### Name: coef.drc
### Title: Extract Model Coefficients
### Aliases: coef.drc
### Keywords: models nonlinear

### ** Examples


## Fitting a four-parameter log-logistic model
ryegrass.m1 <- drm(rootl ~ conc, data = ryegrass, fct = LL.4())
coef(ryegrass.m1)




