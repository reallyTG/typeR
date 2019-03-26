library(rv)


### Name: points.rv
### Title: Add Points and Intervals to a Plot
### Aliases: points.rv
### Keywords: aplot

### ** Examples


  x <- as.rv(1:10)
  y <- rvnorm(mean=x)
  par(mfrow=c(2,2))
  plot(x, y, main="Fixed x-coordinate")
  plot(y, x, main="Fixed y-coordinate")
  plot(x, y, lwd=4, rvcol="red", main="Color and line width changed")
  plot(x, y, type="b", main="Intervals and random lines", rvcol="blue", col="gray")
  ## Not run: 
##D     # Don't use the rv-only parameters when plotting fixed vectors.
##D     plot(x, E(y), rvcol="blue", col="gray")
##D     plot(x, E(y), rvcol="blue", col="gray")
##D   
## End(Not run)




