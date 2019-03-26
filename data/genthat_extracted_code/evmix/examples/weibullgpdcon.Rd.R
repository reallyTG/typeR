library(evmix)


### Name: weibullgpdcon
### Title: Weibull Bulk and GPD Tail Extreme Value Mixture Model with
###   Single Continuity Constraint
### Aliases: weibullgpdcon dweibullgpdcon pweibullgpdcon qweibullgpdcon
###   rweibullgpdcon dweibullgpdcon weibullgpdcon pweibullgpdcon
###   qweibullgpdcon rweibullgpdcon pweibullgpdcon weibullgpdcon
###   dweibullgpdcon qweibullgpdcon rweibullgpdcon qweibullgpdcon
###   weibullgpdcon dweibullgpdcon pweibullgpdcon rweibullgpdcon
###   rweibullgpdcon weibullgpdcon dweibullgpdcon pweibullgpdcon
###   qweibullgpdcon

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D x = rweibullgpdcon(1000)
##D xx = seq(-0.1, 6, 0.01)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-1, 6))
##D lines(xx, dweibullgpdcon(xx))
##D 
##D # three tail behaviours
##D plot(xx, pweibullgpdcon(xx), type = "l")
##D lines(xx, pweibullgpdcon(xx, xi = 0.3), col = "red")
##D lines(xx, pweibullgpdcon(xx, xi = -0.3), col = "blue")
##D legend("bottomright", paste("xi =",c(0, 0.3, -0.3)),
##D   col=c("black", "red", "blue"), lty = 1)
##D 
##D x = rweibullgpdcon(1000, phiu = 0.2)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-1, 6))
##D lines(xx, dweibullgpdcon(xx, phiu = 0.2))
##D 
##D plot(xx, dweibullgpdcon(xx, xi=0, phiu = 0.2), type = "l")
##D lines(xx, dweibullgpdcon(xx, xi=-0.2, phiu = 0.2), col = "red")
##D lines(xx, dweibullgpdcon(xx, xi=0.2, phiu = 0.2), col = "blue")
##D legend("topright", c("xi = 0", "xi = 0.2", "xi = -0.2"),
##D   col=c("black", "red", "blue"), lty = 1)
## End(Not run)




