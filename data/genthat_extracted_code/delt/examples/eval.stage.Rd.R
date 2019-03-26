library(delt)


### Name: eval.stage
### Title: Returns a stagewise minimization estimate
### Aliases: eval.stage
### Keywords: smooth multivariate

### ** Examples

library(denpro)
dendat<-sim.data(n=100,seed=5,type="mulmodII")
leaf<-13  # the number of leafs of the greedy histograms
M<-5      # the number of greedy histograms

pcf<-eval.stage(dendat,leaf=leaf,M=M)

dp<-draw.pcf(pcf,pnum=c(120,120))
persp(dp$x,dp$y,dp$z,ticktype="detailed",phi=25,theta=-120)




