library(paleoTS)


### Name: fitMult
### Title: Functions to estimate models over multiple time-series
### Aliases: fitMult opt.joint.Mult opt.Mult opt.RW.SameMs opt.RW.SameVs
###   logL.joint.Mult logL.Mult logL.SameMs logL.SameVs
### Keywords: models ts

### ** Examples

 ## create two sequences, with different parameter values
 y1<- sim.GRW(ns=20, ms=0, vs=1)
 y2<- sim.GRW(ns=20, ms=0, vs=0.2)

 ## fit some models with at least some shared dynamics across sequences
 m1<- fitMult(list(y1,y2), model="GRW", method="Joint")
 m2<- fitMult(list(y1,y2), model="URW", method="Joint")
 m3<- fitMult(list(y1,y2), model="Stasis", method="Joint")
 compareModels(m1, m2, m3)
 



