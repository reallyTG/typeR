library(MARSS)


### Name: MARSSparamCIs
### Title: Standard Errors, Confidence Intervals and Bias for MARSS
###   Parameters
### Aliases: MARSSparamCIs

### ** Examples

  dat <- t(harborSealWA)
  dat <- dat[2:4,]
  kem <- MARSS(dat, model=list(Z=matrix(1,3,1), 
     R="diagonal and unequal"))
  kem.with.CIs.from.hessian <- MARSSparamCIs(kem)
  kem.with.CIs.from.hessian



