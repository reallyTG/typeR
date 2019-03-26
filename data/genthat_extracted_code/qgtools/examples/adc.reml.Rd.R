library(qgtools)


### Name: adc.reml
### Title: ADC model with REML analysis
### Aliases: adc.reml
### Keywords: ADC model cotton REML cotf2

### ** Examples


 library(qgtools)
 data(cotf2)
 dat=cotf2[which(cotf2$Env==1),]
 
 Ped=dat[,c(1:5)]
 Y=dat[,c(6,7)]
 
 res=adc.reml(Y,Ped)
 res$Var
 res$FixedEffect
 res$RandomEffect

 ##End




