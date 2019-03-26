library(drc)


### Name: PR
### Title: Expected or predicted response
### Aliases: PR
### Keywords: models nonlinear

### ** Examples


ryegrass.m1 <- drm(ryegrass, fct = LL.4())
PR(ryegrass.m1, c(5, 10))

ryegrass.m2 <- drm(ryegrass, fct = LL2.4())
PR(ryegrass.m2, c(5, 10))

spinach.m1 <- drm(SLOPE~DOSE, CURVE, data=spinach, fct = LL.4())
PR(spinach.m1, c(5, 10))




