library(qgtools)


### Name: adaa.simu.jack
### Title: An R function for AD model simulation
### Aliases: adaa.simu.jack
### Keywords: AD model REML MINQUE cotton jackknife

### ** Examples

  library(qgtools)
  data(cotf2)
  dat=cotf2[which(cotf2$Env==1),]
  Ped=dat[,c(1:5)]
  Y=dat[,-c(1:5)]
  #Ped=cotf2[,c(1:5)]
  #Y=cotf2[,-c(1:5)]
  YS=adaa.simudata(Y,Ped,v=rep(20,5),b=c(100),SimuNum=10)
  res=adaa.simu.jack(YS,Ped,JacNum=5)
  res
  ##End





