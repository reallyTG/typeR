library(VGAM)


### Name: Posnorm
### Title: The Positive-Normal Distribution
### Aliases: Posnorm dposnorm pposnorm qposnorm rposnorm
### Keywords: distribution

### ** Examples

## Not run: 
##D  m <-  0.8; x <- seq(-1, 4, len = 501)
##D plot(x, dposnorm(x, m = m), type = "l", las = 1, ylim = 0:1,
##D      ylab = paste("posnorm(m = ", m, ", sd = 1)"), col = "blue",
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles")
##D abline(h = 0, col = "grey")
##D lines(x, pposnorm(x, m = m), col = "orange", type = "l")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qposnorm(probs, m = m)
##D lines(Q, dposnorm(Q, m = m), col = "purple", lty = 3, type = "h")
##D lines(Q, pposnorm(Q, m = m), col = "purple", lty = 3, type = "h")
##D abline(h = probs, col = "purple", lty = 3)
##D max(abs(pposnorm(Q, m = m) - probs))  # Should be 0
## End(Not run)



