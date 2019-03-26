library(Rdistance)


### Name: F.double.obs.prob
### Title: Compute double observer probability of detection (No external
###   covariates allowed)
### Aliases: F.double.obs.prob
### Keywords: model

### ** Examples

#   Fake observers
  set.seed(538392)
  obsrv <- data.frame( obsby.1=rbinom(100,1,.75), obsby.2=rbinom(100,1,.5) )
  
  F.double.obs.prob( obsrv, observer=1 )
  F.double.obs.prob( obsrv, observer=2 )
  F.double.obs.prob( obsrv, observer="both" )



