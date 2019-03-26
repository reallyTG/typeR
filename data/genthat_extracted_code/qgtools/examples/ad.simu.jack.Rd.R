library(qgtools)


### Name: ad.simu.jack
### Title: An R function for AD model simulation
### Aliases: ad.simu.jack
### Keywords: AD model REML MINQUE cotton jackknife

### ** Examples

  library(qgtools)
  data(cotf2)
  Ped=cotf2[,c(1:5)]
  Y=cotf2[,-c(1:5)]
  YS=ad.simudata(Y,Ped,v=rep(20,7),b=c(100),SimuNum=10)
  res=ad.simu.jack(YS,Ped,JacNum=5)
  res
  ##End





