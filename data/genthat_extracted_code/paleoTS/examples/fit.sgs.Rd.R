library(paleoTS)


### Name: fit.sgs
### Title: Analyze evolutionary models with well-sampled punctuations
### Aliases: fit.sgs opt.sgs logL.sgs logL.sgs.omega
### Keywords: models ts

### ** Examples

 x<- sim.sgs(ns=c(10, 10, 10), ms=0.5, vs=0.3, omega=0.1)
 plot(x)
 # compare sampled punctuation to uniform unbiased random walk
 w.sgs<- fit.sgs(x, minb=8, model="GRW")
 w.urw<- opt.URW(x)
 compareModels(w.urw, w.sgs)
 



