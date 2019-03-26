library(qgtools)


### Name: ad4.reml
### Title: Additive-dominance (AD) model with REML analysis for
###   multi-parent mating designs
### Aliases: ad4.reml
### Keywords: AD model multi-parent mating design REML wheat

### ** Examples


 library(qgtools)
 data(wheat)
 n=nrow(wheat)
 id=sample(n,200)
 dat=wheat[id,]
 Ped=dat[,c(1:6)]
 Y=as.matrix(dat[,8])
 colnames(Y)=colnames(dat)[8]
 
 res=ad4.reml(Y,Ped)
 res$Var
 res$FixedEffect
 res$RandomEffect

 ##End




