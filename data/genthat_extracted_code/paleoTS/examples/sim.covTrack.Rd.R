library(paleoTS)


### Name: sim.covTrack
### Title: Simulate time-series that tracks a covariate
### Aliases: sim.covTrack
### Keywords: models ts

### ** Examples

 z<- rnorm(20)
 x<- sim.covTrack(ns=20, b=2, evar=0.3, z)
 plot(diff(z), diff(x$mm), xlab="Change in covariate", ylab="Change in Trait")
 abline(h=0, lty=3)
 abline(v=0, lty=3)




