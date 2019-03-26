library(qgtools)


### Name: adm.reml.jack
### Title: ADM model awith REML analysis and jackknife test
### Aliases: adm.reml.jack
### Keywords: ADM model REML cotf12 jaccknife

### ** Examples


 library(qgtools)
 data(cotf2)
 
 dat=cotf2[which(cotf2$Env==1),]
 Ped=dat[,c(1:5)]
 Y=dat[,-c(1:5)]
 res=adm.mq.jack(Y,Ped,JacNum=5)
 res$Var
 res$PVar
 res$FixedEffect
 res$RandomEffect

 ##End



