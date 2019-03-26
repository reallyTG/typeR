library(drc)


### Name: NEC
### Title: Dose-response model for estimation of no effect concentration
###   (NEC).
### Aliases: NEC NEC.2 NEC.3 NEC.4
### Keywords: models nonlinear

### ** Examples


nec.m1 <- drm(rootl~conc, data=ryegrass, fct=NEC.4())

summary(nec.m1)

plot(nec.m1)

abline(v=coef(nec.m1)[4], lty=2)  # showing the estimated threshold 




