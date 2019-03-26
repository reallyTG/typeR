library(VGAM)


### Name: Lino
### Title: The Generalized Beta Distribution (Libby and Novick, 1982)
### Aliases: Lino dlino plino qlino rlino
### Keywords: distribution

### ** Examples

## Not run: 
##D lambda <- 0.4; shape1 <- exp(1.3); shape2 <- exp(1.3)
##D x <- seq(0.0, 1.0, len = 101)
##D plot(x, dlino(x, shape1 = shape1, shape2 = shape2, lambda = lambda),
##D      type = "l", col = "blue", las = 1, ylab = "",
##D      main = "Blue is density, red is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles")
##D abline(h = 0, col = "blue", lty = 2)
##D lines(x, plino(x, shape1 = shape1, shape2 = shape2, l = lambda), col = "red")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qlino(probs, shape1 = shape1, shape2 = shape2, lambda = lambda)
##D lines(Q, dlino(Q, shape1 = shape1, shape2 = shape2, lambda = lambda),
##D       col = "purple", lty = 3, type = "h")
##D plino(Q, shape1 = shape1, shape2 = shape2, l = lambda) - probs  # Should be all 0
## End(Not run)



