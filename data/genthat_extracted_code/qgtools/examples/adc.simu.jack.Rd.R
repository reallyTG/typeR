library(qgtools)


### Name: adc.simu.jack
### Title: An R function for ADC model simulation
### Aliases: adc.simu.jack
### Keywords: ADC model REML MINQUE cotton jackknife

### ** Examples

  library(qgtools)
  data(cotf2)
  dat=cotf2[which(cotf2$Env==1),]
  Ped=dat[,c(1:5)]
  Y=dat[,c(6,7)]
  #Ped=cotf2[,c(1:5)]
  #Y=cotf2[,-c(1:5)]
  YS=adc.simudata(Y,Ped,v=rep(20,5),b=c(100),SimuNum=5)
  res=adc.simu.jack(YS,Ped,JacNum=5)
  res
  ##End





