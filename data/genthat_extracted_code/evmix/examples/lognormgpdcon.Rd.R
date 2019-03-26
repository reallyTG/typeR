library(evmix)


### Name: lognormgpdcon
### Title: Log-Normal Bulk and GPD Tail Extreme Value Mixture Model with
###   Single Continuity Constraint
### Aliases: lognormgpdcon dlognormgpdcon plognormgpdcon qlognormgpdcon
###   rlognormgpdcon dlognormgpdcon lognormgpdcon plognormgpdcon
###   qlognormgpdcon rlognormgpdcon plognormgpdcon lognormgpdcon
###   dlognormgpdcon qlognormgpdcon rlognormgpdcon qlognormgpdcon
###   lognormgpdcon dlognormgpdcon plognormgpdcon rlognormgpdcon
###   rlognormgpdcon lognormgpdcon dlognormgpdcon plognormgpdcon
###   qlognormgpdcon

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D x = rlognormgpdcon(1000)
##D xx = seq(-1, 10, 0.01)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-1, 10))
##D lines(xx, dlognormgpdcon(xx))
##D 
##D # three tail behaviours
##D plot(xx, plognormgpdcon(xx), type = "l")
##D lines(xx, plognormgpdcon(xx, xi = 0.3), col = "red")
##D lines(xx, plognormgpdcon(xx, xi = -0.3), col = "blue")
##D legend("bottomright", paste("xi =",c(0, 0.3, -0.3)),
##D   col=c("black", "red", "blue"), lty = 1)
##D 
##D x = rlognormgpdcon(1000, u = 2, phiu = 0.2)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-1, 10))
##D lines(xx, dlognormgpdcon(xx, u = 2, phiu = 0.2))
##D 
##D plot(xx, dlognormgpdcon(xx, u = 2, xi=0, phiu = 0.2), type = "l")
##D lines(xx, dlognormgpdcon(xx, u = 2, xi=-0.2, phiu = 0.2), col = "red")
##D lines(xx, dlognormgpdcon(xx, u = 2, xi=0.2, phiu = 0.2), col = "blue")
##D legend("topright", c("xi = 0", "xi = 0.2", "xi = -0.2"),
##D   col=c("black", "red", "blue"), lty = 1)
## End(Not run)




