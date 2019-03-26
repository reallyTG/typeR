library(qgtools)


### Name: adm.reml
### Title: ADM model with REML analysis
### Aliases: adm.reml
### Keywords: ADM model cotton REML cotf2

### ** Examples


 library(qgtools)
 data(cotf2)
  dat=cotf2[which(cotf2$Env==1),]
 Ped=dat[,c(1:5)]
 Y=dat[,-c(1:5)]
 
 res=adm.reml(Y,Ped)
 res$Var
 res$FixedEffect
 res$RandomEffect

 ##End




