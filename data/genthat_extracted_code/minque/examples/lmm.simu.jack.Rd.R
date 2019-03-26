library(minque)


### Name: lmm.simu.jack
### Title: An R function for linear mixed model simulation.
### Aliases: lmm.simu.jack
### Keywords: simulation MINQUE linear mixed model variance components
###   jackknife REML

### ** Examples

  library(minque)
  data(ncii)
  
  lmm.inf=lmm.check(Yld~1|Female*Male+Rep,data=ncii)

  lmm.inf  ##there are five variance components
  v=c(20,20,20,20,20) ##there are five variance components
  b=as.vector(100)    ##there is only population mean as fixed effect
  Y=lmm.simudata(Yld~1|Female*Male+Rep,data=ncii,v=v,b=b,SimuNum=50)
  Female=factor(ncii$Female)
  Male=factor(ncii$Male)
  Rep=factor(ncii$Rep)
  res=lmm.simu.jack(Y~1|Female*Male+Rep)
  res[[1]]

  #End




