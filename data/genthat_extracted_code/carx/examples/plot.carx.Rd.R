library(carx)


### Name: plot.carx
### Title: Plot a fitted 'carx' object
### Aliases: plot.carx

### ** Examples


#case 1: plot with cenTS object in the object, note that the x-axis is in date.
dat = carxSimCenTS(nObs=100,seed=0)
mdl <- carx(y~X1+X2-1,data=dat, p=2, CI.compute = FALSE)
#use default settings
plot(mdl)

#case 2: plot without cenTS object in the object, note that the x-axis is a vector of numbers.
dat = carxSim(nObs=100,seed=0)
mdl <- carx(y=dat$y, x=dat[,c("X1","X2")], ci=dat$ci, lcl=dat$lcl, ucl=dat$ucl, p=2)
#or simply call
mdl <- carx(y~X1+X2-1,data=dat, p=2, CI.compute = FALSE)
plot(mdl)



