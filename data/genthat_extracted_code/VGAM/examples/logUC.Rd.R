library(VGAM)


### Name: Log
### Title: Logarithmic Distribution
### Aliases: Log dlog plog qlog rlog
### Keywords: distribution

### ** Examples

dlog(1:20, 0.5)
rlog(20, 0.5)

## Not run: 
##D  shape <- 0.8; x <- 1:10
##D plot(x, dlog(x, shape = shape), type = "h", ylim = 0:1,
##D      sub = "shape=0.8", las = 1, col = "blue", ylab = "shape",
##D      main = "Logarithmic distribution: blue=density; orange=distribution function")
##D lines(x + 0.1, plog(x, shape = shape), col = "orange", lty = 3, type = "h") 
## End(Not run)



