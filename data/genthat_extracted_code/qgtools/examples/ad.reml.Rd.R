library(qgtools)


### Name: ad.reml
### Title: Additive-dominance (AD) model with REML analysis
### Aliases: ad.reml
### Keywords: AD model cotton REML cotf2

### ** Examples


 library(qgtools)
 data(cotf2)
 dat=cotf2[which(cotf2$Env==1),]
 Ped=dat[,c(1:5)]
 Y=dat[,-c(1:5)]
 
 res=ad.reml(Y,Ped)
 res$Var
 res$FixedEffect
 res$RandomEffect

 ##End




