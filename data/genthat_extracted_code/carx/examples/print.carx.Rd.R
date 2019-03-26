library(carx)


### Name: print.carx
### Title: Print a short description of the fitted model
### Aliases: print.carx

### ** Examples

dat = carxSim(nObs=100,seed=0)
mdl <- carx(y~X1+X2-1,data=dat, p=2, CI.compute = FALSE)
print(mdl)



