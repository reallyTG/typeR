library(drc)


### Name: EXD
### Title: Exponential decay model
### Aliases: EXD.2 EXD.3
### Keywords: models nonlinear

### ** Examples


## Fitting an exponential decay model
ryegrass.m1<-drm(rootl~conc, data=ryegrass, fct=EXD.3())

plot(ryegrass.m1)

summary(ryegrass.m1)




