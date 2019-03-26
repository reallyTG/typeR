library(RFgroove)


### Name: projectWavelet
### Title: Projection in a wavelet basis
### Aliases: projectWavelet

### ** Examples

  data(toyRegFD)
  x <- toyRegFD$FDlist[[1]]

  design <- projectWavelet(xdata=x)
  print(colnames(design))



