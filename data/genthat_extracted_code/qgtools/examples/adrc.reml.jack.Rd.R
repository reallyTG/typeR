library(qgtools)


### Name: adrc.reml.jack
### Title: AD model with row and column effects analyzed by MINQUE and
###   jackknife
### Aliases: adrc.reml.jack
### Keywords: ad model REML row effect column effect jackknife

### ** Examples

  library(qgtools)
  data(adrcdat)
  dat=adrcdat[which(adrcdat$Env==1&adrcdat$Row<=3),]
  Ped=dat[,c(1,4,5,6)]
  Y=as.matrix(dat[,8])
 
  colnames(Y)=colnames(dat)[8]
  
  Row=dat$Row
  Col=dat$Column

  
  ##run AD model with field row and column effects 
  res=adrc.reml.jack(Y,Ped,Row=Row,JacNum=5) 
  res$Var
  res$PVar
  res$FixedEffect
  res$RandomEffect



