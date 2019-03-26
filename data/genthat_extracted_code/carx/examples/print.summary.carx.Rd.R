library(carx)


### Name: print.summary.carx
### Title: Print a summary of an 'carx' object
### Aliases: print.summary.carx

### ** Examples

dat = carxSim(nObs=100,seed=0)
mdl <- carx(y~X1+X2-1,data=dat, p=2, CI.compute = FALSE)
summary(mdl)



