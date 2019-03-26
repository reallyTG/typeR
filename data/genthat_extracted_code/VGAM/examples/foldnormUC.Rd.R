library(VGAM)


### Name: Foldnorm
### Title: The Folded-Normal Distribution
### Aliases: Foldnorm dfoldnorm pfoldnorm qfoldnorm rfoldnorm
### Keywords: distribution

### ** Examples

## Not run: 
##D m <- 1.5; SD <- exp(0)
##D x <- seq(-1, 4, len = 501)
##D plot(x, dfoldnorm(x, m = m, sd = SD), type = "l", ylim = 0:1, las = 1,
##D      ylab = paste("foldnorm(m = ", m, ", sd = ", round(SD, digits = 3), ")"),
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple lines are the 10,20,...,90 percentiles", col = "blue")
##D abline(h = 0, col = "gray50")
##D lines(x, pfoldnorm(x, m = m, sd = SD), col = "orange")
##D probs <- seq(0.1, 0.9, by = 0.1)
##D Q <- qfoldnorm(probs, m = m, sd = SD)
##D lines(Q, dfoldnorm(Q, m = m, sd = SD), col = "purple", lty = 3, type = "h")
##D lines(Q, pfoldnorm(Q, m = m, sd = SD), col = "purple", lty = 3, type = "h")
##D abline(h = probs, col = "purple", lty = 3)
##D max(abs(pfoldnorm(Q, m = m, sd = SD) - probs))  # Should be 0
## End(Not run)



