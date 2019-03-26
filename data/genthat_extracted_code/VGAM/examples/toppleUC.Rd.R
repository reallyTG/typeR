library(VGAM)


### Name: Topple
### Title: The Topp-Leone Distribution
### Aliases: Topple dtopple ptopple qtopple rtopple
### Keywords: distribution

### ** Examples

## Not run: 
##D  shape <- 0.7; x <- seq(0.02, 0.999, length = 300)
##D plot(x, dtopple(x, shape = shape), type = "l", col = "blue", las = 1,
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles", ylab = "")
##D abline(h = 0, col = "blue", lty = 2)
##D lines(x, ptopple(x, shape = shape), type = "l", col = "orange")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qtopple(probs, shape = shape)
##D lines(Q, dtopple(Q, shape), col = "purple", lty = 3, type = "h")
##D lines(Q, ptopple(Q, shape), col = "purple", lty = 3, type = "h")
##D abline(h = probs, col = "purple", lty = 3)
##D max(abs(ptopple(Q, shape) - probs))  # Should be zero
## End(Not run)



