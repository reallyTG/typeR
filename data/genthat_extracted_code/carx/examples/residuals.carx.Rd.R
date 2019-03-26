library(carx)


### Name: residuals.carx
### Title: Residuals of a fitted 'carx' object
### Aliases: residuals.carx

### ** Examples

dat = carxSim(nObs=100,seed=0)
mdl <- carx(y~X1+X2-1,data=dat, p=2, CI.compute = FALSE)
#compute the raw residuals
res = residuals(mdl,type="raw")
#compute the Pearson residuals
res = residuals(mdl,type="pearson")



