library(MARSS)


### Name: MARSSboot
### Title: Bootstrap MARSS Parameter Estimates
### Aliases: MARSSboot

### ** Examples

  #nboot is set low in these examples in order to run quickly
  #normally nboot would be >1000 at least
  dat <- t(kestrel)
  dat <- dat[2:3,]
  #maxit set low to speed up the example
  kem <- MARSS(dat, model=list(U="equal",Q=diag(.01,2)), 
     control=list(maxit=50))
  # bootstrap parameters from a Hessian matrix
  hess.list <- MARSSboot(kem, param.gen="hessian", nboot=4)

  # from resampling the innovations (no missing values allowed)
  boot.innov.list <- MARSSboot(kem, output="all", sim="innovations", nboot=4)

  # bootstrapped parameter estimates
  hess.list$boot.params



