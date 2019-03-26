library(MARSS)


### Name: MARSSkem
### Title: Maximum Likelihood Estimation for Multivariate Autoregressive
###   State-Space Models
### Aliases: MARSSkem

### ** Examples

  dat <- t(harborSeal)
  dat <- dat[2:4,] 
  #you can use MARSS to construct a proper marssMLE object.
  MLEobj <- MARSS(dat, model=list(Q="diagonal and equal", U="equal"), fit=FALSE) 
  #Pass this MLEobj to MARSSkem to do the fit.
  kemfit <- MARSSkem(MLEobj)



