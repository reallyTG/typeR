library(VGAM)


### Name: Betanorm
### Title: The Beta-Normal Distribution
### Aliases: Betanorm dbetanorm pbetanorm qbetanorm rbetanorm
### Keywords: distribution

### ** Examples

## Not run: 
##D shape1 <- 0.1; shape2 <- 4; m <- 1
##D x <- seq(-10, 2, len = 501)
##D plot(x, dbetanorm(x, shape1, shape2, m = m), type = "l", ylim = 0:1, las = 1,
##D      ylab = paste("betanorm(",shape1,", ",shape2,", m=",m, ", sd=1)", sep = ""),
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Gray lines are the 10,20,...,90 percentiles", col = "blue")
##D lines(x, pbetanorm(x, shape1, shape2, m = m), col = "orange")
##D abline(h = 0, col = "black")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qbetanorm(probs, shape1, shape2, m = m)
##D lines(Q, dbetanorm(Q, shape1, shape2, m = m), col = "gray50", lty = 2, type = "h")
##D lines(Q, pbetanorm(Q, shape1, shape2, m = m), col = "gray50", lty = 2, type = "h")
##D abline(h = probs, col = "gray50", lty = 2)
##D pbetanorm(Q, shape1, shape2, m = m) - probs  # Should be all 0
## End(Not run)



