library(spatstat)


### Name: discretise
### Title: Safely Convert Point Pattern Window to Binary Mask
### Aliases: discretise
### Keywords: spatial manip

### ** Examples

  data(demopat)
  X <- demopat
  plot(X, main="original pattern")
  Y <- discretise(X, dimyx=50)
  plot(Y, main="discretise(X)")
  stopifnot(npoints(X) == npoints(Y))

  # what happens if we just convert the window to a mask?
  W <- Window(X)
  M <- as.mask(W, dimyx=50)
  plot(M, main="window of X converted to mask")
  plot(X, add=TRUE, pch=16)
  plot(X[M], add=TRUE, pch=1, cex=1.5)
  XM <- X[M]
  cat(paste(npoints(X) - npoints(XM), "points of X lie outside M\n"))



