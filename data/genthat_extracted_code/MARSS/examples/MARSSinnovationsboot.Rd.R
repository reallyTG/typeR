library(MARSS)


### Name: MARSSinnovationsboot
### Title: Bootstrapped Data using Stoffer and Wall's Algorithm
### Aliases: MARSSinnovationsboot

### ** Examples

  dat <- t(kestrel)
  dat <- dat[2:3,]
  MLEobj <- MARSS(dat, model=list(U="equal",Q=diag(.01,2)))
  boot.obj <- MARSSinnovationsboot(MLEobj)



