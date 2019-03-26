library(VGAM)


### Name: exppois
### Title: The Exponential Poisson Distribution
### Aliases: exppois dexppois pexppois qexppois rexppois
### Keywords: distribution

### ** Examples

## Not run: 
##D  rate <- 2; shape <- 0.5; nn <- 201
##D x <- seq(-0.05, 1.05, len = nn)
##D plot(x, dexppois(x, rate = rate, shape), type = "l", las = 1, ylim = c(0, 3),
##D      ylab = paste("fexppoisson(rate = ", rate, ", shape = ", shape, ")"),
##D      col = "blue", cex.main = 0.8,
##D      main = "Blue is the density, orange the cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles")
##D lines(x, pexppois(x, rate = rate, shape), col = "orange")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qexppois(probs, rate = rate, shape)
##D lines(Q, dexppois(Q, rate = rate, shape), col = "purple", lty = 3, type = "h")
##D lines(Q, pexppois(Q, rate = rate, shape), col = "purple", lty = 3, type = "h")
##D abline(h = probs, col = "purple", lty = 3); abline(h = 0, col = "gray50")
##D max(abs(pexppois(Q, rate = rate, shape) - probs))  # Should be 0
## End(Not run)



