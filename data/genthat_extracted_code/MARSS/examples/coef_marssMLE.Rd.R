library(MARSS)


### Name: coef.marssMLE
### Title: Coefficient function for MARSS MLE objects
### Aliases: coef coef.MARSS coef.marssMLE coef.marss

### ** Examples
 
  dat <- t(harborSeal)
  dat <- dat[c(2,11),]
  MLEobj <- MARSS(dat)
  
  coef(MLEobj)
  coef(MLEobj,type="vector")
  coef(MLEobj,type="matrix")
  #to retrieve just the Q matrix
  coef(MLEobj,type="matrix")$Q



