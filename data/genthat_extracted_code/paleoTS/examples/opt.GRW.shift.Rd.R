library(paleoTS)


### Name: opt.GRW.shift
### Title: Functions for random walks with shifting parameters
### Aliases: opt.GRW.shift
### Keywords: models ts

### ** Examples

 x<- sim.GRW.shift(ns=c(20,20), ms=c(0,1), vs=c(0.2, 0.2))
 plot(x)
 m.urw<- fitSimple(x, model="URW", method="AD")
 m.shift<- opt.GRW.shift(x, model=1)	# only AD method is available for this model
 compareModels(m.urw, m.shift)
 shift.time<- x$tt[m.shift$parameters["shift1"]]
 abline(v=shift.time, col="red", abline=3)



