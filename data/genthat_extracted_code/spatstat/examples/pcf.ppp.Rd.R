library(spatstat)


### Name: pcf.ppp
### Title: Pair Correlation Function of Point Pattern
### Aliases: pcf.ppp
### Keywords: spatial nonparametric

### ** Examples

  X <- simdat
  ## Don't show: 
    X <- X[seq(1,npoints(X), by=4)]
  
## End(Don't show)
  p <- pcf(X)
  plot(p, main="pair correlation function for X")
  # indicates inhibition at distances r < 0.3

  pd <- pcf(X, divisor="d")

  # compare estimates
  plot(p, cbind(iso, theo) ~ r, col=c("blue", "red"),
         ylim.covers=0, main="", lwd=c(2,1), lty=c(1,3), legend=FALSE)
  plot(pd, iso ~ r, col="green", lwd=2, add=TRUE)
  legend("center", col=c("blue", "green"), lty=1, lwd=2,
         legend=c("divisor=r","divisor=d"))

  # calculate approximate variance and show POINTWISE confidence bands
  pv <- pcf(X, var.approx=TRUE)
  plot(pv, cbind(iso, iso+2*sqrt(v), iso-2*sqrt(v)) ~ r)



