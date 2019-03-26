library(qgtools)


### Name: adaa.reml.jack
### Title: ADAA model with REML and jacknife analyses
### Aliases: adaa.reml.jack
### Keywords: ADAA model REML jaccknife cotf12

### ** Examples


 library(qgtools)

 data(cotf2)
 dat=cotf2[which(cotf2$Env==1),]
 Ped=dat[,c(1:5)]
 Y=dat[,-c(1:5)][,1:2]
 res=adaa.reml.jack(Y,Ped,JacNum=5)
 res$Var
 res$FixedEffect
 res$RandomEffect

 ##End



