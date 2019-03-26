library(qgtools)


### Name: adc4.mq
### Title: ADC model with MINQUE analysis for multi-parent mating designs
### Aliases: adc4.mq
### Keywords: ADC model multi-parent mating design MINQUE wheat

### ** Examples


 library(qgtools)
 data(wheat)
 n=nrow(wheat)
 id=sample(n,200)
 dat=wheat[id,]
 Ped=dat[,c(1:6)]
 Y=as.matrix(dat[,8])
 colnames(Y)=colnames(dat)[8]
 
 res=adc4.mq(Y,Ped)
 res$Var
 res$FixedEffect
 res$RandomEffect

 ##End




