library(qgtools)


### Name: adaa.mq.jack
### Title: ADAA model with MINQUE and jacknife analyses
### Aliases: adaa.mq.jack
### Keywords: ADAA model minque jaccknife cotf12

### ** Examples


 library(qgtools)

 data(cotf12)
 names(cotf12)
 dat=cotf12[which(cotf12$Year==1),]
 Ped=dat[,c(1,3:6)]
 Y=dat[,-c(1:6)]
 #Ped=cotf12[,c(1,3:6)]
 #Y=cotf12[,-c(1:6)]
 
 res=adaa.mq.jack(Y,Ped,JacNum=5)
 res$Var
 res$FixedEffect
 res$RandomEffect

 ##End



