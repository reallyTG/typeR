library(evmix)


### Name: normgpd
### Title: Normal Bulk and GPD Tail Extreme Value Mixture Model
### Aliases: normgpd dnormgpd pnormgpd qnormgpd rnormgpd dnormgpd normgpd
###   pnormgpd qnormgpd rnormgpd pnormgpd normgpd dnormgpd qnormgpd
###   rnormgpd qnormgpd normgpd dnormgpd pnormgpd rnormgpd rnormgpd normgpd
###   dnormgpd pnormgpd qnormgpd

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D x = rnormgpd(1000)
##D xx = seq(-4, 6, 0.01)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 6))
##D lines(xx, dnormgpd(xx))
##D 
##D # three tail behaviours
##D plot(xx, pnormgpd(xx), type = "l")
##D lines(xx, pnormgpd(xx, xi = 0.3), col = "red")
##D lines(xx, pnormgpd(xx, xi = -0.3), col = "blue")
##D legend("topleft", paste("xi =",c(0, 0.3, -0.3)),
##D   col=c("black", "red", "blue"), lty = 1)
##D 
##D x = rnormgpd(1000, phiu = 0.2)
##D xx = seq(-4, 6, 0.01)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 6))
##D lines(xx, dnormgpd(xx, phiu = 0.2))
##D 
##D plot(xx, dnormgpd(xx, xi=0, phiu = 0.2), type = "l")
##D lines(xx, dnormgpd(xx, xi=-0.2, phiu = 0.2), col = "red")
##D lines(xx, dnormgpd(xx, xi=0.2, phiu = 0.2), col = "blue")
##D legend("topleft", c("xi = 0", "xi = 0.2", "xi = -0.2"),
##D   col=c("black", "red", "blue"), lty = 1)
## End(Not run)




