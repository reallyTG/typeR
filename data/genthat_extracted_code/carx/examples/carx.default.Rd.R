library(carx)


### Name: carx.default
### Title: The default estimation method for a CARX model
### Aliases: carx.default

### ** Examples

dat = carxSim(nObs=100,seed=0)
mdl <- carx(y=dat$y, x=dat[,c("X1","X2")], ci=dat$ci, lcl=dat$lcl, ucl=dat$ucl, p=2)
#or simply call
mdl <- carx(y~X1+X2-1,data=dat, p=2, CI.compute = FALSE)



