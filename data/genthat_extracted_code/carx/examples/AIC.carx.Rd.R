library(carx)


### Name: AIC.carx
### Title: Compute the AIC of a fitted 'carx' object
### Aliases: AIC.carx

### ** Examples

dat = carxSim(nObs=100,seed=0)
mdl <- carx(y~X1+X2-1,data=dat, p=2, CI.compute = FALSE)
ic = AIC(mdl)



