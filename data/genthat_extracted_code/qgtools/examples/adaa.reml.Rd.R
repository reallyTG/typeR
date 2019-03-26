library(qgtools)


### Name: adaa.reml
### Title: Additive-dominance (AD) with additive-additive interaction model
###   with REML analysis
### Aliases: adaa.reml
### Keywords: ADAA model cotton REML cotf2

### ** Examples

 library(qgtools)
 data(cotf12)
 #names(cotf12)
 dat=cotf12[which(cotf12$Year==1),]
 Ped=dat[,c(1,3:6)]
 Y=dat[,-c(1:6)]
 #Ped=cotf12[,c(1,3:6)]
 #Y=cotf12[,-c(1:6)]
 res=adaa.reml(Y,Ped)
 res$Var
 res$FixedEffect
 res$RandomEffect

 ##End




