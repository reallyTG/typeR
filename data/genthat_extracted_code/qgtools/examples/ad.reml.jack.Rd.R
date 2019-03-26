library(qgtools)


### Name: ad.reml.jack
### Title: AD model with REML analysis and jackknife resampling test
### Aliases: ad.reml.jack
### Keywords: AD model cotton REML cotf2 jackknife

### ** Examples

 library(qgtools)
 data(cotf2)
 dat=cotf2[which(cotf2$Env==1),]
 Ped=dat[,c(1:5)]
 Y=dat[,-c(1:5)]
 
 res=ad.reml.jack(Y,Ped)
 res$Var
 res$FixedEffect
 res$RandomEffect

 ##End




