library(VGAM)


### Name: Nakagami
### Title: Nakagami Distribution
### Aliases: Nakagami dnaka pnaka qnaka rnaka
### Keywords: distribution

### ** Examples

## Not run: 
##D  x <- seq(0, 3.2, len = 200)
##D plot(x, dgamma(x, shape = 1), type = "n", col = "black", ylab = "",
##D      ylim = c(0,1.5), main = "dnaka(x, shape = shape)")
##D lines(x, dnaka(x, shape = 1), col = "orange")
##D lines(x, dnaka(x, shape = 2), col = "blue")
##D lines(x, dnaka(x, shape = 3), col = "green")
##D legend(2, 1.0, col = c("orange","blue","green"), lty = rep(1, len = 3),
##D        legend = paste("shape =", c(1, 2, 3)))
##D 
##D plot(x, pnorm(x), type = "n", col = "black", ylab = "",
##D      ylim = 0:1, main = "pnaka(x, shape = shape)")
##D lines(x, pnaka(x, shape = 1), col = "orange")
##D lines(x, pnaka(x, shape = 2), col = "blue")
##D lines(x, pnaka(x, shape = 3), col = "green")
##D legend(2, 0.6, col = c("orange","blue","green"), lty = rep(1, len = 3),
##D        legend = paste("shape =", c(1, 2, 3))) 
## End(Not run)

probs <- seq(0.1, 0.9, by = 0.1)
pnaka(qnaka(p = probs, shape = 2), shape = 2) - probs  # Should be all 0



