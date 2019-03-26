library(qgtools)


### Name: adc.reml.jack
### Title: ADC model with REML analysis and jackknife resampling test
### Aliases: adc.reml.jack
### Keywords: ADC model cotton REML cotf2 jackknife

### ** Examples

 library(qgtools)
 data(cotf2)
 dat=cotf2[which(cotf2$Env==1),]
 #Ped=dat[,c(1,3:6)]
 #Y=dat[,-c(1:6)]
 Ped=dat[,c(1:5)]
 Y=dat[,c(6,7)]
 
 res=adc.reml.jack(Y,Ped,JacNum=5)
 res$Var
 res$PVar
 res$FixedEffect
 res$RandomEffect

 ##End




