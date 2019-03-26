library(MARSS)


### Name: MARSSkf
### Title: Kalman Filtering and Smoothing for Time-varying MARSS models
### Aliases: MARSSkf MARSSkfas MARSSkfss

### ** Examples

  dat <- t(harborSeal)
  dat <- dat[2:nrow(dat),]
  #you can use MARSS to construct a MLEobj
  #MARSS calls MARSSinits to construct default initial values
  MLEobj <- MARSS(dat, fit=FALSE)
  #MARSSkf needs a marss MLE object with the par element set
  MLEobj$par <- MLEobj$start
  #Compute the kf output at the params used for the inits 
  kfList <- MARSSkfas( MLEobj )



