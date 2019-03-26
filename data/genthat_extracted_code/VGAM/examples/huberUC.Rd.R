library(VGAM)


### Name: dhuber
### Title: Huber's Least Favourable Distribution
### Aliases: dhuber edhuber rhuber qhuber phuber
### Keywords: distribution

### ** Examples

set.seed(123456)
edhuber(1:5, k = 1.5)
rhuber(5)

## Not run: 
##D  mu <- 3; xx <- seq(-2, 7, len = 100)  # Plot CDF and PDF
##D plot(xx, dhuber(xx, mu = mu), type = "l", col = "blue", las = 1, ylab = "",
##D      main = "blue is density, orange is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles",
##D      ylim = 0:1)
##D abline(h = 0, col = "blue", lty = 2)
##D lines(xx, phuber(xx, mu = mu), type = "l", col = "orange")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qhuber(probs, mu = mu)
##D lines(Q, dhuber(Q, mu = mu), col = "purple", lty = 3, type = "h")
##D lines(Q, phuber(Q, mu = mu), col = "purple", lty = 3, type = "h")
##D abline(h = probs, col = "purple", lty = 3)
##D phuber(Q, mu = mu) - probs  # Should be all 0s
## End(Not run)



