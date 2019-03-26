library(VGAM)


### Name: explog
### Title: The Exponential Logarithmic Distribution
### Aliases: explog dexplog pexplog qexplog rexplog
### Keywords: distribution

### ** Examples

## Not run: 
##D shape <- 0.5; scale <- 2; nn <- 501
##D x <- seq(-0.50, 6.0, len = nn)
##D plot(x, dexplog(x, scale, shape), type = "l", las = 1, ylim = c(0, 1.1),
##D      ylab = paste("[dp]explog(shape = ", shape, ", scale = ", scale, ")"),
##D      col = "blue", cex.main = 0.8,
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles")
##D lines(x, pexplog(x, scale, shape), col = "orange")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qexplog(probs, scale, shape = shape)
##D lines(Q, dexplog(Q, scale, shape = shape), col = "purple", lty = 3, type = "h")
##D lines(Q, pexplog(Q, scale, shape = shape), col = "purple", lty = 3, type = "h")
##D abline(h = probs, col = "purple", lty = 3)
##D max(abs(pexplog(Q, scale, shape = shape) - probs)) # Should be 0
## End(Not run)



