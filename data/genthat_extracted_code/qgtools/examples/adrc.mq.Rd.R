library(qgtools)


### Name: adrc.mq
### Title: AD model with row and column effects
### Aliases: adrc.mq
### Keywords: ad model MINQUE row effect column effect

### ** Examples

  library(qgtools)
  data(adrcdat)
  dat=adrcdat[which(adrcdat$Env==1),]
  Ped=dat[,c(1,4,5,6)]
  Y=dat[,c(8:10)]
  Row=dat$Row
  Col=dat$Column
      
  res=adrc.mq(Y,Ped,Row=Row,Col=Col) ##run AD model without jackknifing under row and column effects
  res$Var
  res$FixedEffect
  res$RandomEffect






