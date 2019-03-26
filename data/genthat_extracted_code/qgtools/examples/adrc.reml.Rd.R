library(qgtools)


### Name: adrc.reml
### Title: AD model with row and column effects analyzed by REML approach
### Aliases: adrc.reml
### Keywords: ad model REML row effect column effect

### ** Examples

  library(qgtools)
  data(adrcdat)
  dat=adrcdat[which(adrcdat$Env==1),]
  Ped=dat[,c(1,4,5,6)]
  Y=dat[,c(8:10)]
  Row=dat$Row
  Col=dat$Column

  ##run AD model without jackknifing under row and column effects
  
  res=adrc.reml(Y,Ped,Row=Row,Col=Col) 
  res$Var
  res$FixedEffect
  res$RandomEffect






