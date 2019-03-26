library(carx)


### Name: tsdiag.carx
### Title: Show diagnostic plots for a 'carx' object
### Aliases: tsdiag.carx

### ** Examples

dat = carxSim(nObs=100,seed=0)
mdl <- carx(y~X1+X2-1,data=dat, p=2, CI.compute = FALSE)
tsdiag(mdl)



