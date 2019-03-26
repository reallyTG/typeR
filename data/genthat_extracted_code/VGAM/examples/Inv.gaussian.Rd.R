library(VGAM)


### Name: Inv.gaussian
### Title: The Inverse Gaussian Distribution
### Aliases: Inv.gaussian dinv.gaussian pinv.gaussian rinv.gaussian
### Keywords: distribution

### ** Examples

## Not run: 
##D  x <- seq(-0.05, 4, len = 300)
##D plot(x, dinv.gaussian(x, mu = 1, lambda = 1), type = "l",
##D      col = "blue",las = 1, main =
##D      "blue is density, orange is cumulative distribution function")
##D abline(h = 0, col = "gray", lty = 2)
##D lines(x, pinv.gaussian(x, mu = 1, lambda = 1), type = "l", col = "orange") 
## End(Not run)



