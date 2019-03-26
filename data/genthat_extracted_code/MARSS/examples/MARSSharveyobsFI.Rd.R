library(MARSS)


### Name: MARSSharveyobsFI
### Title: MARSS Hessian Matrix via the Harvey (1989) Recursion
### Aliases: MARSSharveyobsFI

### ** Examples

  dat <- t(harborSeal)
  dat <- dat[c(2,11),]
  MLEobj <- MARSS(dat)
  MARSS:::MARSSharveyobsFI(MLEobj)



