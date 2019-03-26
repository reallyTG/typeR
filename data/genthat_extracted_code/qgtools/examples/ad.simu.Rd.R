library(qgtools)


### Name: ad.simu
### Title: An R function for AD model simulation.
### Aliases: ad.simu
### Keywords: ADC model REML MINQUE cotton

### ** Examples

  library(qgtools)
  data(cotf2)
  Ped=cotf2[,c(1:5)]
  Y=cotf2[,-c(1:5)]
  YS=ad.simudata(Y,Ped,v=rep(20,7),b=c(100),SimuNum=10)
  res=ad.simu(YS,Ped,method=c("minque"),ALPHA=0.05)
  res
  ##End





