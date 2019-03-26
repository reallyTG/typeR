library(paleoTS)


### Name: sim.OU
### Title: Simulate evolutionary time-series
### Aliases: sim.OU ou.M ou.V
### Keywords: models ts

### ** Examples

x1<- sim.OU(ns=100, anc=0, theta=10, alpha=0.2, vs=0.1, vp=0.1, nn=rep(100, times=100), tt=0:99)
plot(x1)



