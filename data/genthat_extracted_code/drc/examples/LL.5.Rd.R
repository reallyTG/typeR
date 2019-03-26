library(drc)


### Name: LL.5
### Title: The five-parameter log-logistic function
### Aliases: LL.5 l5 LL2.5
### Keywords: models nonlinear

### ** Examples


ryegrass.m1 <- drm(rootl ~ conc, data = ryegrass, fct = LL.5())
summary(ryegrass.m1)




