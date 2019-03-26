library(evmix)


### Name: weibullgpd
### Title: Weibull Bulk and GPD Tail Extreme Value Mixture Model
### Aliases: weibullgpd dweibullgpd pweibullgpd qweibullgpd rweibullgpd
###   dweibullgpd weibullgpd pweibullgpd qweibullgpd rweibullgpd
###   pweibullgpd weibullgpd dweibullgpd qweibullgpd rweibullgpd
###   qweibullgpd weibullgpd dweibullgpd pweibullgpd rweibullgpd
###   rweibullgpd weibullgpd dweibullgpd pweibullgpd qweibullgpd

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D x = rweibullgpd(1000)
##D xx = seq(-1, 6, 0.01)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-1, 6))
##D lines(xx, dweibullgpd(xx))
##D 
##D # three tail behaviours
##D plot(xx, pweibullgpd(xx), type = "l")
##D lines(xx, pweibullgpd(xx, xi = 0.3), col = "red")
##D lines(xx, pweibullgpd(xx, xi = -0.3), col = "blue")
##D legend("topleft", paste("xi =",c(0, 0.3, -0.3)),
##D   col=c("black", "red", "blue"), lty = 1)
##D 
##D x = rweibullgpd(1000, phiu = 0.2)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-1, 6))
##D lines(xx, dweibullgpd(xx, phiu = 0.2))
##D 
##D plot(xx, dweibullgpd(xx, xi=0, phiu = 0.2), type = "l")
##D lines(xx, dweibullgpd(xx, xi=-0.2, phiu = 0.2), col = "red")
##D lines(xx, dweibullgpd(xx, xi=0.2, phiu = 0.2), col = "blue")
##D legend("topleft", c("xi = 0", "xi = 0.2", "xi = -0.2"),
##D   col=c("black", "red", "blue"), lty = 1)
##D   
## End(Not run)



