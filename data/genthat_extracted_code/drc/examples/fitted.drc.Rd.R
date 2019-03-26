library(drc)


### Name: fitted.drc
### Title: Extract fitted values from model
### Aliases: fitted.drc
### Keywords: models nonlinear

### ** Examples


ryegrass.m1 <- drm(rootl ~ conc, data = ryegrass, fct = LL.4())
plot(fitted(ryegrass.m1), residuals(ryegrass.m1))  # a residual plot




