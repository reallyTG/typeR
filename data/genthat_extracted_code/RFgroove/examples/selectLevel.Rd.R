library(RFgroove)


### Name: selectLevel
### Title: Wavelet levels selection procedure
### Aliases: selectLevel

### ** Examples

  data(toyRegFD)
  x <- toyRegFD$FDlist[[1]]
  y <- toyRegFD$Y

  design <- projectWavelet(xdata=x)
  summary(levSel <- selectLevel(design, y, ntree=100, verbose=TRUE))
  plot(levSel)




