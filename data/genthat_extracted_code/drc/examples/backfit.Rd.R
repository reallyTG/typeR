library(drc)


### Name: backfit
### Title: Calculation of backfit values from a fitted dose-response model
### Aliases: backfit
### Keywords: models nonlinear

### ** Examples


ryegrass.LL.4 <- drm(rootl~conc, data=ryegrass, fct=LL.4())

backfit(ryegrass.LL.4)




