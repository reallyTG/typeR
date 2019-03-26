library(qgtools)


### Name: adaa.mq
### Title: ADAA model with MINQUE analysis
### Aliases: adaa.mq
### Keywords: ADAA model cotton MINQUE cotf12

### ** Examples


 library(qgtools)
 data(cotf12)
 names(cotf12)
 dat=cotf12[which(cotf12$Year==1),]
 Ped=dat[,c(1,3:6)]
 Y=dat[,-c(1:6)]
 #Ped=cotf12[,c(1,3:6)]
 #Y=cotf12[,-c(1:6)]
 res=adaa.mq(Y,Ped)
 res$Var
 res$FixedEffect
 res$RandomEffect

 ##End




