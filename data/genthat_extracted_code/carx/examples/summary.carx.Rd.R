library(carx)


### Name: summary.carx
### Title: Summarize the fitted 'carx' object
### Aliases: summary.carx

### ** Examples

dat = carxSim(nObs=100,seed=0)
mdl <- carx(y~X1+X2-1,data=dat, p=2, CI.compute = FALSE)
summary(mdl)



