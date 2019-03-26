library(paleoTS)


### Name: opt.covTrack
### Title: Covariate-tracking model
### Aliases: opt.covTrack opt.covTrack.Mult logL.covTrack
###   logL.Mult.covTrack opt.joint.covTrack opt.joint.covTrack.Mult
###   logL.joint.covTrack logL.Mult.joint.covTrack
### Keywords: models ts

### ** Examples

 z<- rnorm(20)
 x<- sim.covTrack(ns=20, b=2, evar=0.1, z=z)
 plot(diff(z), diff(x$mm), xlab="Change in covariate", ylab="Change in Trait")
 abline(h=0, lty=3)
 abline(v=0, lty=3)
 mct<- opt.covTrack(x, z)
 print(round(mct$parameters,2))  # should be close to generating values
 print(x$genpar)



