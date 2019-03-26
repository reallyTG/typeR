library(VGAM)


### Name: Otzeta
### Title: One-truncated Zeta Distribution
### Aliases: Otzeta dotzeta potzeta qotzeta rotzeta
### Keywords: distribution

### ** Examples

dotzeta(1:20, 0.5)
rotzeta(20, 0.5)

## Not run: 
##D  shape <- 0.8; x <- 1:10
##D plot(x, dotzeta(x, shape = shape), type = "h", ylim = 0:1,
##D      sub = "shape=0.8", las = 1, col = "blue", ylab = "Probability",
##D      main = "1-truncated zeta distribution: blue=PMF; orange=CDF")
##D lines(x + 0.1, potzeta(x, shape = shape), col = "orange", lty = 3, type = "h") 
## End(Not run)



