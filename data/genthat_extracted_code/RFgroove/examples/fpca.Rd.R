library(RFgroove)


### Name: fpca
### Title: Functional Principal Component Analysis
### Aliases: fpca

### ** Examples

  data(toyRegFD)
  x <- toyRegFD$FDlist[[1]]
  PCs <- fpca(x=x, nbasisInit=32, propVar=.9, reconstruct=TRUE)
  plot(x[1,])
  lines(PCs$smoothData[1,], col=2)



