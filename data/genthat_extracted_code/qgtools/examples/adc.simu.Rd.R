library(qgtools)


### Name: adc.simu
### Title: An R function for ADC model simulation.
### Aliases: adc.simu
### Keywords: ADC model REML MINQUE cotton

### ** Examples

  library(qgtools)
  data(cotf2)
  dat=cotf2[which(cotf2$Env==1),]
 
  Ped=dat[,c(1:5)]
  Y=dat[,c(6,7)]
  #Ped=cotf2[,c(1:5)]
  #Y=cotf2[,-c(1:5)]
  YS=adc.simudata(Y,Ped,v=rep(20,5),b=c(100),SimuNum=10)
  res=adc.simu(YS,Ped)
  res
  ##End





