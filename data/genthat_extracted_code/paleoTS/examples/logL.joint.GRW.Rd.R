library(paleoTS)


### Name: logL.joint.GRW
### Title: Log-likelihoods for evolutionary models (joint parameterization)
### Aliases: logL.joint.GRW logL.joint.URW logL.joint.Stasis
###   logL.joint.StrictStasis logL.joint.OU
### Keywords: models ts

### ** Examples

x<- sim.GRW(ns=20, ms=0, vs=1)
L1<- logL.joint.GRW(p=c(0,0,1), x)	# actual parameters
L2<- logL.joint.GRW(p=c(0,10,1), x)	# should be a bad guess
cat(L1, L2, "\n")



