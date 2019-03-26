library(paleoTS)


### Name: sim.GRW
### Title: Simulate evolutionary time-series
### Aliases: sim.GRW sim.Stasis
### Keywords: models ts

### ** Examples

 ## generate and plot two paleoTS objects
 y.rw <- sim.GRW(ns=20, ms=0.5, vs=0.1)  
 y.st <- sim.Stasis(ns=20)
 layout(1:2)
 plot(y.rw, col="red")
 plot(y.st, col="blue")
 layout(1)



