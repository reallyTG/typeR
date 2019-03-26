library(carx)


### Name: logLik.carx
### Title: The quasi-log-likelihood of a 'carx' object
### Aliases: logLik.carx

### ** Examples

dat = carxSim(nObs=100,seed=0)
mdl <- carx(y~X1+X2-1,data=dat, p=2, CI.compute = FALSE)
lk = logLik(mdl)



