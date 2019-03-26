library(spatstat)


### Name: Extract.linnet
### Title: Extract Subset of Linear Network
### Aliases: [.linnet
### Keywords: spatial manip

### ** Examples

  p <- par(mfrow=c(1,2), mar=0.2+c(0,0,1,0))
  B <- owin(c(0.1,0.7),c(0.19,0.6))

  plot(simplenet, main="x[w, snip=TRUE]")
  plot(simplenet[B], add=TRUE, col="green", lwd=3)
  plot(B, add=TRUE, border="red", lty=3)

  plot(simplenet, main="x[w, snip=FALSE]")
  plot(simplenet[B, snip=FALSE], add=TRUE, col="green", lwd=3)
  plot(B, add=TRUE, border="red", lty=3)

  par(p)



