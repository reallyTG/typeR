library(minque)


### Name: lmm.simudata
### Title: An R function to generate a simulated data set
### Aliases: lmm.simudata
### Keywords: simulation linear mixed model variance components

### ** Examples

  library(minque)
  data(ncii)
  
  lmm.inf=lmm.check(Yld~1|Female*Male+Rep,data=ncii)

  lmm.inf  ##there are five variance components
  v=c(20,20,20,20,20) ##there are five variance components
  b=as.vector(100)    ##there is only population mean as fixed effect
  Y=lmm.simudata(Yld~1|Female*Male+Rep,data=ncii,v=v,b=b,SimuNum=50)
  

  
  #End




