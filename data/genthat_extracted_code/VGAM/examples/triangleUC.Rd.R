library(VGAM)


### Name: Triangle
### Title: The Triangle Distribution
### Aliases: Triangle dtriangle ptriangle qtriangle rtriangle
### Keywords: distribution

### ** Examples

## Not run: 
##D  x <- seq(-0.1, 1.1, by = 0.01); theta <- 0.75
##D plot(x, dtriangle(x, theta = theta), type = "l", col = "blue", las = 1,
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles",
##D      ylim = c(0,2), ylab = "")
##D abline(h = 0, col = "blue", lty = 2)
##D lines(x, ptriangle(x, theta = theta), col = "orange")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qtriangle(probs, theta = theta)
##D lines(Q, dtriangle(Q, theta = theta), col = "purple", lty = 3, type = "h")
##D ptriangle(Q, theta = theta) - probs  # Should be all zero
##D abline(h = probs, col = "purple", lty = 3) 
## End(Not run)



