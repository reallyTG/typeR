library(MARSS)


### Name: MARSShessian
### Title: MARSS Parameter Variance-Covariance Matrix from the Hessian
###   Matrix
### Aliases: MARSShessian MARSSFisherI

### ** Examples

  dat = t(harborSeal)
  dat = dat[c(2,11),]
  MLEobj = MARSS(dat)
  MLEobj.hessian = MARSShessian(MLEobj)

  #show the approx Hessian
  MLEobj.hessian$Hessian
  
  #generate a parameter sample using the Hessian
  #this uses the rmvnorm function in the mvtnorm package
  hess.params = mvtnorm::rmvnorm(1, mean=MLEobj.hessian$parMean, 
                           sigma=MLEobj.hessian$parSigma)
        



