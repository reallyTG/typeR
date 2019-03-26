library(carx)


### Name: fitted.carx
### Title: Fitted values of a 'carx' object
### Aliases: fitted.carx

### ** Examples

dat = carxSim(nObs=100,seed=0)
mdl <- carx(y~X1+X2-1,data=dat, p=2, CI.compute = FALSE)
#compute the fitted values
fv = fitted(mdl)



