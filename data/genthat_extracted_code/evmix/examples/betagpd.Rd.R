library(evmix)


### Name: betagpd
### Title: Beta Bulk and GPD Tail Extreme Value Mixture Model
### Aliases: betagpd dbetagpd pbetagpd qbetagpd rbetagpd dbetagpd betagpd
###   pbetagpd qbetagpd rbetagpd pbetagpd betagpd dbetagpd qbetagpd
###   rbetagpd qbetagpd betagpd dbetagpd pbetagpd rbetagpd rbetagpd betagpd
###   dbetagpd pbetagpd qbetagpd

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D x = rbetagpd(1000, bshape1 = 1.5, bshape2 = 2, u = 0.7, phiu = 0.2)
##D xx = seq(-0.1, 2, 0.01)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 2))
##D lines(xx, dbetagpd(xx, bshape1 = 1.5, bshape2 = 2, u = 0.7, phiu = 0.2))
##D 
##D # three tail behaviours
##D plot(xx, pbetagpd(xx, bshape1 = 1.5, bshape2 = 2, u = 0.7, phiu = 0.2), type = "l")
##D lines(xx, pbetagpd(xx, bshape1 = 1.5, bshape2 = 2, u = 0.7, phiu = 0.2, xi = 0.3), col = "red")
##D lines(xx, pbetagpd(xx, bshape1 = 1.5, bshape2 = 2, u = 0.7, phiu = 0.2, xi = -0.3), col = "blue")
##D legend("bottomright", paste("xi =",c(0, 0.3, -0.3)),
##D   col=c("black", "red", "blue"), lty = 1)
##D 
##D x = rbetagpd(1000, bshape1 = 2, bshape2 = 0.8, u = 0.7, phiu = 0.5)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 2))
##D lines(xx, dbetagpd(xx, bshape1 = 2, bshape2 = 0.6, u = 0.7, phiu = 0.5))
##D 
##D plot(xx, dbetagpd(xx, bshape1 = 2, bshape2 = 0.8, u = 0.7, phiu = 0.5, xi=0), type = "l")
##D lines(xx, dbetagpd(xx, bshape1 = 2, bshape2 = 0.8, u = 0.7, phiu = 0.5, xi=-0.2), col = "red")
##D lines(xx, dbetagpd(xx, bshape1 = 2, bshape2 = 0.8, u = 0.7, phiu = 0.5, xi=0.2), col = "blue")
##D legend("topright", c("xi = 0", "xi = 0.2", "xi = -0.2"),
##D   col=c("black", "red", "blue"), lty = 1)
## End(Not run)




