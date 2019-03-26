library(spatstat)


### Name: Extract.lpp
### Title: Extract Subset of Point Pattern on Linear Network
### Aliases: [.lpp
### Keywords: spatial manip

### ** Examples

  # Chicago crimes data - remove cases of assault
  chicago[marks(chicago) != "assault"]
  # equivalent to subset(chicago, select=-assault)

  # spatial window subset
  B <- owin(c(350, 700), c(600, 1000))
  plot(chicago)
  plot(B, add=TRUE, lty=2, border="red", lwd=3)
  op <- par(mfrow=c(1,2), mar=0.6+c(0,0,1,0))
  plot(B, main="chicago[B, snip=FALSE]", lty=3, border="red")
  plot(chicago[, B, snip=FALSE], add=TRUE)
  plot(B, main="chicago[B, snip=TRUE]", lty=3, border="red")
  plot(chicago[, B, snip=TRUE], add=TRUE)
  par(op)



