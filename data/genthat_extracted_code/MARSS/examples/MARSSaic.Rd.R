library(MARSS)


### Name: MARSSaic
### Title: AIC for MARSS Models
### Aliases: MARSSaic

### ** Examples

  dat <- t(harborSealWA)
  dat <- dat[2:3,]
  kem <- MARSS(dat, model=list(Z=matrix(1,2,1), 
    R="diagonal and equal"))
  kemAIC = MARSSaic(kem, output=c("AIC","AICc"))



