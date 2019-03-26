library(qgtools)


### Name: adm.mq
### Title: An ADM model with MINQUE analysis
### Aliases: adm.mq
### Keywords: ADM model cotton MINQUE cotf2

### ** Examples


 library(qgtools)
 data(cotf2)
 
 dat=cotf2[which(cotf2$Env==1),]
 Ped=dat[,c(1:5)]
 Y=dat[,-c(1:5)]
 
 res=adm.mq(Y,Ped)
 res$Var
 res$FixedEffect
 res$RandomEffect
 ##End




