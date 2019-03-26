library(MARSS)


### Name: MARSShessian.numerical
### Title: MARSS Hessian Matrix via Numerical Approximation
### Aliases: MARSShessian.numerical

### ** Examples

  dat <- t(harborSeal)
  dat <- dat[c(2,11),]
  MLEobj <- MARSS(dat)
  MARSS:::MARSShessian.numerical(MLEobj)



