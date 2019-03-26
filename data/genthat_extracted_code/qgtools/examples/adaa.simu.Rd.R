library(qgtools)


### Name: adaa.simu
### Title: An R function for AD model simulation.
### Aliases: adaa.simu
### Keywords: ADAA model REML MINQUE cotton

### ** Examples

  library(qgtools)
  data(cotf2)
  dat=cotf2[which(cotf2$Env==1),]
  Ped=dat[,c(1:5)]
  Y=dat[,-c(1:5)]
  #Ped=cotf2[,c(1:5)]
  #Y=cotf2[,-c(1:5)]
  YS=adaa.simudata(Y,Ped,v=rep(20,5),b=c(100),SimuNum=10)
  res=adaa.simu(YS,Ped,ALPHA=0.05)
  res
  ##End





