library(VGAM)


### Name: expgeom
### Title: The Exponential Geometric Distribution
### Aliases: expgeom dexpgeom pexpgeom qexpgeom rexpgeom
### Keywords: distribution

### ** Examples

## Not run: 
##D shape <- 0.5; scale <- 1; nn <- 501
##D x <- seq(-0.10, 3.0, len = nn)
##D plot(x, dexpgeom(x, scale, shape), type = "l", las = 1, ylim = c(0, 2),
##D      ylab = paste("[dp]expgeom(shape = ", shape, ", scale = ", scale, ")"),
##D      col = "blue", cex.main = 0.8,
##D      main = "Blue is density, red is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles")
##D lines(x, pexpgeom(x, scale, shape), col = "red")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qexpgeom(probs, scale, shape)
##D lines(Q, dexpgeom(Q, scale, shape), col = "purple", lty = 3, type = "h")
##D lines(Q, pexpgeom(Q, scale, shape), col = "purple", lty = 3, type = "h")
##D abline(h = probs, col = "purple", lty = 3)
##D max(abs(pexpgeom(Q, scale, shape) - probs))  # Should be 0
## End(Not run)



