library(evmix)


### Name: betagpdcon
### Title: Beta Bulk and GPD Tail Extreme Value Mixture Model with Single
###   Continuity Constraint
### Aliases: betagpdcon dbetagpdcon pbetagpdcon qbetagpdcon rbetagpdcon
###   dbetagpdcon betagpdcon pbetagpdcon qbetagpdcon rbetagpdcon
###   pbetagpdcon betagpdcon dbetagpdcon qbetagpdcon rbetagpdcon
###   qbetagpdcon betagpdcon dbetagpdcon pbetagpdcon rbetagpdcon
###   rbetagpdcon betagpdcon dbetagpdcon pbetagpdcon qbetagpdcon

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D x = rbetagpdcon(1000, bshape1 = 1.5, bshape2 = 2, u = 0.7, phiu = 0.2)
##D xx = seq(-0.1, 2, 0.01)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 2))
##D lines(xx, dbetagpdcon(xx, bshape1 = 1.5, bshape2 = 2, u = 0.7, phiu = 0.2))
##D 
##D # three tail behaviours
##D plot(xx, pbetagpdcon(xx, bshape1 = 1.5, bshape2 = 2, u = 0.7, phiu = 0.2), type = "l")
##D lines(xx, pbetagpdcon(xx, bshape1 = 1.5, bshape2 = 2, u = 0.7, phiu = 0.2, xi = 0.3), col = "red")
##D lines(xx, pbetagpdcon(xx, bshape1 = 1.5, bshape2 = 2, u = 0.7, phiu = 0.2, xi = -0.3), col = "blue")
##D legend("topleft", paste("xi =",c(0, 0.3, -0.3)),
##D   col=c("black", "red", "blue"), lty = 1)
##D 
##D x = rbetagpdcon(1000, bshape1 = 2, bshape2 = 0.8, u = 0.7, phiu = 0.5)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 2))
##D lines(xx, dbetagpdcon(xx, bshape1 = 2, bshape2 = 0.6, u = 0.7, phiu = 0.5))
##D 
##D plot(xx, dbetagpdcon(xx, bshape1 = 2, bshape2 = 0.8, u = 0.7, phiu = 0.5, xi=0), type = "l")
##D lines(xx, dbetagpdcon(xx, bshape1 = 2, bshape2 = 0.8, u = 0.7, phiu = 0.5, xi=-0.2), col = "red")
##D lines(xx, dbetagpdcon(xx, bshape1 = 2, bshape2 = 0.8, u = 0.7, phiu = 0.5, xi=0.2), col = "blue")
##D legend("topright", c("xi = 0", "xi = 0.2", "xi = -0.2"),
##D   col=c("black", "red", "blue"), lty = 1)
## End(Not run)




