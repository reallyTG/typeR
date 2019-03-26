library(qgtools)


### Name: ad.mq.jack
### Title: Additive-dominance (AD) model with MINQUE analysis and jackknife
### Aliases: ad.mq.jack
### Keywords: AD model MINQUE jaccknife cotf12

### ** Examples


 library(qgtools)
 data(cotf12)
 #names(cotf12)
 dat=cotf12[which(cotf12$Year==1),]
 Ped=dat[,c(1,3:6)]
 Y=dat[,-c(1:6)]
 res=ad.mq.jack(Y,Ped)
 res$Var
 res$PVar
 res$FixedEffect
 res$RandomEffect

 ##End



