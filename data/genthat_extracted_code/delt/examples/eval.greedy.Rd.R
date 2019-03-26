library(delt)


### Name: eval.greedy
### Title: Returns a greedy histogram
### Aliases: eval.greedy
### Keywords: smooth multivariate

### ** Examples

library(denpro)
dendat<-sim.data(n=200,seed=5,type="mulmodII")
eva<-eval.greedy(dendat,leaf=15)

dp<-draw.pcf(eva,pnum=c(60,60))         
persp(dp$x,dp$y,dp$z,theta=-20,phi=30)




