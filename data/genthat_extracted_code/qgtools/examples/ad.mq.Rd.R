library(qgtools)


### Name: ad.mq
### Title: Additive-dominance (AD) model with MINQUE analysis
### Aliases: ad.mq
### Keywords: AD model cotton MINQUE cotf2

### ** Examples


 library(qgtools)
 data(cotf2)
 Ped=cotf2[,c(1:5)]
 Y=cotf2[,-c(1:5)]
 
 res=ad.mq(Y,Ped)
 res$Var
 res$FixedEffect
 res$RandomEffect

 ##End




