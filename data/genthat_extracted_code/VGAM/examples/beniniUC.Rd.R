library(VGAM)


### Name: Benini
### Title: The Benini Distribution
### Aliases: Benini dbenini pbenini qbenini rbenini
### Keywords: distribution

### ** Examples

## Not run: 
##D y0 <- 1; shape <- exp(1)
##D xx <- seq(0.0, 4, len = 101)
##D plot(xx, dbenini(xx, y0 = y0, shape = shape), type = "l", col = "blue",
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles", ylim = 0:1,
##D      las = 1, ylab = "", xlab = "x")
##D abline(h = 0, col = "blue", lty = 2)
##D lines(xx, pbenini(xx, y0 = y0, shape = shape), col = "orange")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qbenini(probs, y0 = y0, shape = shape)
##D lines(Q, dbenini(Q, y0 = y0, shape = shape),
##D       col = "purple", lty = 3, type = "h")
##D pbenini(Q, y0 = y0, shape = shape) - probs  # Should be all zero
## End(Not run)



