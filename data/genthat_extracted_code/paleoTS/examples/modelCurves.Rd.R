library(paleoTS)


### Name: modelCurves
### Title: Function computes model expectations and 95
### Aliases: modelCurves
### Keywords: models ts

### ** Examples

 x1<- sim.punc(theta=c(0,10), omega=c(2,2))
 w1<- fitGpunc(x1, ng=2)
 plot(x1, modelFit=w1) 
 
 x2<- sim.GRW(ns=20, ms=1, vs=0.4)
 w2<- opt.GRW(x2)
 plot(x2, modelFit=w2)




