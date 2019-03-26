library(BMS)


### Name: BMS-package
### Title: Bayesian Model Sampling 0.3.4
### Aliases: BMS-package BMS
### Keywords: package

### ** Examples

data(datafls)
mfls =bms(X.data=datafls,burn=1000,iter=9000,nmodel=100)
  info.bma(mfls)
  coef(mfls)
  coef(mfls,exact=TRUE,std.coefs=TRUE) 
  mfls[3]$topmod 
  image(mfls[1:20],FALSE) 
  plotModelsize(mfls,exact=TRUE) 
  density(mfls,"Spanish")
  



