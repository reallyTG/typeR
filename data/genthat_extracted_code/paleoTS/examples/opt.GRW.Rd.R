library(paleoTS)


### Name: opt.GRW
### Title: Numerically find maximum likelihood solutions to evolutionary
###   models
### Aliases: opt.GRW opt.URW opt.Stasis opt.StrictStasis
### Keywords: models ts

### ** Examples

 ## generate data for a directional sequence
 y <- sim.GRW(ns=30, ms=1, vs=1)
 plot(y)
 m.rw<- opt.GRW(y)
 m.rwu<- opt.URW(y)
 m.sta<- opt.Stasis(y)
 m.ss<- opt.StrictStasis(y)

 ## print log-likelihoods; easier to use function fit4models()
 compareModels(m.rw, m.rwu, m.sta, m.ss)



