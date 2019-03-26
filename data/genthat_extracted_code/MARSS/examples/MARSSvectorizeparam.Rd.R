library(MARSS)


### Name: MARSSvectorizeparam
### Title: Vectorize or Replace the par List
### Aliases: MARSSvectorizeparam

### ** Examples

  dat <- t(harborSealWA)
  dat <- dat[2:4,]
  kem <- MARSS(dat)
  paramvec = MARSS:::MARSSvectorizeparam(kem)
  paramvec



