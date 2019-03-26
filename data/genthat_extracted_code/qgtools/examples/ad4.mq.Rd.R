library(qgtools)


### Name: ad4.mq
### Title: Additive-dominance (AD) model with MINQUE analysis for
###   multi-parent mating designs
### Aliases: ad4.mq
### Keywords: AD model multi-parent mating design MINQUE wheat

### ** Examples


 library(qgtools)
 data(wheat)
 n=nrow(wheat)
 id=sample(n,200)
 dat=wheat[id,]
 Ped=dat[,c(1:6)]
 Y=as.matrix(dat[,8])
 colnames(Y)=colnames(dat)[8]
 
 res=ad4.mq(Y,Ped)
 res$Var
 res$FixedEffect
 res$RandomEffect

 ##End




