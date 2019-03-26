library(bda)


### Name: gof
### Title: Goodness of fit test
### Aliases: gof gof.default gof.bdata gof.histogram gof.FMKL gof.GB
### Keywords: distribution stats

### ** Examples

  data(hhi)
  hmob <- binning(counts=hhi$mob, breaks=hhi$breaks)
  lmd5 <- fit.GLD.FMKL(hmob)
  gof(lmd5)




