library(VGAM)


### Name: Tikuv
### Title: A Short-tailed Symmetric Distribution
### Aliases: Tikuv dtikuv ptikuv qtikuv rtikuv
### Keywords: distribution

### ** Examples

## Not run: 
##D  par(mfrow = c(2, 1))
##D x <- seq(-5, 5, len = 401)
##D plot(x, dnorm(x), type = "l", col = "black", ylab = "", las = 1,
##D      main = "Black is standard normal, others are dtikuv(x, d)")
##D lines(x, dtikuv(x, d = -10), col = "orange")
##D lines(x, dtikuv(x, d = -1 ), col = "blue")
##D lines(x, dtikuv(x, d =  1 ), col = "green")
##D legend("topleft", col = c("orange","blue","green"), lty = rep(1, len = 3),
##D        legend = paste("d =", c(-10, -1, 1)))
##D 
##D plot(x, pnorm(x), type = "l", col = "black", ylab = "", las = 1,
##D      main = "Black is standard normal, others are ptikuv(x, d)")
##D lines(x, ptikuv(x, d = -10), col = "orange")
##D lines(x, ptikuv(x, d = -1 ), col = "blue")
##D lines(x, ptikuv(x, d =  1 ), col = "green")
##D legend("topleft", col = c("orange","blue","green"), lty = rep(1, len = 3),
##D        legend = paste("d =", c(-10, -1, 1))) 
## End(Not run)

probs <- seq(0.1, 0.9, by = 0.1)
ptikuv(qtikuv(p = probs, d =  1), d = 1) - probs  # Should be all 0



