library(sme)


### Name: sme.data.frame
### Title: Smoothing-splines mixed-effects model fit(s) from a data.frame
###   object
### Aliases: sme.data.frame

### ** Examples

  ## Not run: data(MTB)
  ## Not run: system.time(fits <- sme(MTB,numberOfThreads=1))
  ## Not run: sapply(fits,logLik)

  ## Not run: system.time(fits <- sme(MTB,numberOfThreads=10))
  ## Not run: sapply(fits,logLik)



