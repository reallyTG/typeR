library(qgtools)


### Name: adm.simu
### Title: An R function for ADM model simulation.
### Aliases: adm.simu
### Keywords: ADM model REML MINQUE cotton

### ** Examples

  library(qgtools)
  data(cotf2)
 
  dat=cotf2[which(cotf2$Env==1),]
  Ped=dat[,c(1:5)]
  Y=dat[,-c(1:5)]
  YS=adm.simudata(Y,Ped,v=rep(20,6),b=c(100),SimuNum=10)
  res=adm.simu(YS,Ped)
  res
  ##End





