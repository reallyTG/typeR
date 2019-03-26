library(qgtools)


### Name: adrc.mq.jack
### Title: AD model with row and column effects analyzed by MINQUE and
###   jackknife
### Aliases: adrc.mq.jack
### Keywords: ad model MINQUE row effect column effect jackknife

### ** Examples

  library(qgtools)
  data(adrcdat)
  dat=adrcdat[which(adrcdat$Env==1),]
  Ped=dat[,c(1,4,5,6)]
  Y=dat[,c(8:10)]
  Row=dat$Row
  Col=dat$Column
  
  ##run AD model with field row and column effects 
  res=adrc.mq.jack(Y,Ped,Row=Row,Col=Col,JacNum=5)
  res$Var
  res$PVar
  res$FixedEffect
  res$RandomEffect



