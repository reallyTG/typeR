library(qgtools)


### Name: ad4.mq.jack
### Title: Additive-dominance (AD) model, multi-parent mating designs,
###   MINQUE, and jackknife
### Aliases: ad4.mq.jack
### Keywords: AD model multi-parent mating design MINQUE wheat jackknife

### ** Examples


 library(qgtools)
 data(wheat)
 n=nrow(wheat)
 id=sample(n,200)
 dat=wheat[id,]
 Ped=dat[,c(1:6)]
 Y=as.matrix(dat[,8])
 colnames(Y)=colnames(dat)[8]
 
 res=ad4.mq.jack(Y,Ped,JacNum=5)
 res$Var
 res$PVar
 res$FixedEffect
 res$RandomEffect

 ##End




