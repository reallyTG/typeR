library(paleoTS)


### Name: opt.joint.GRW
### Title: Optimize evolutionary models (joint parameterization)
### Aliases: opt.joint.GRW opt.joint.URW opt.joint.Stasis
###   opt.joint.StrictStasis opt.joint.OU
### Keywords: models ts

### ** Examples

 x<- sim.GRW(ns=30, ms=1, vs=1)
 plot(x)
 
 # easier to use  fit3models(, method='Joint') 
 m.urw<- opt.joint.URW(x)
 m.grw<- opt.joint.GRW(x)
 m.sta<- opt.joint.Stasis(x)
 cat(m.urw$AICc, m.grw$AICc, m.sta$AICc, "\n")	# print AICc scores




