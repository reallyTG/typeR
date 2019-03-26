library(qgtools)


### Name: adc.mq
### Title: An ADC with MINQUE analysis
### Aliases: adc.mq
### Keywords: ADC model cotton MINQUE cotf2

### ** Examples


  library(qgtools)
  
  data(cotf2)
  dat=cotf2[which(cotf2$Env==1),]
 
  Ped=dat[,c(1:5)]
  Y=dat[,-c(1:5)]
    
  res=adc.mq(Y,Ped)
  
  res$Var
  res$FixedEffect
  res$RandomEffect

  ##End




