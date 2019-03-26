library(evmix)


### Name: gammagpd
### Title: Gamma Bulk and GPD Tail Extreme Value Mixture Model
### Aliases: gammagpd dgammagpd pgammagpd qgammagpd rgammagpd dgammagpd
###   gammagpd pgammagpd qgammagpd rgammagpd pgammagpd gammagpd dgammagpd
###   qgammagpd rgammagpd qgammagpd gammagpd dgammagpd pgammagpd rgammagpd
###   rgammagpd gammagpd dgammagpd pgammagpd qgammagpd

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D x = rgammagpd(1000, gshape = 2)
##D xx = seq(-1, 10, 0.01)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-1, 10))
##D lines(xx, dgammagpd(xx, gshape = 2))
##D 
##D # three tail behaviours
##D plot(xx, pgammagpd(xx, gshape = 2), type = "l")
##D lines(xx, pgammagpd(xx, gshape = 2, xi = 0.3), col = "red")
##D lines(xx, pgammagpd(xx, gshape = 2, xi = -0.3), col = "blue")
##D legend("bottomright", paste("xi =",c(0, 0.3, -0.3)),
##D   col=c("black", "red", "blue"), lty = 1)
##D 
##D x = rgammagpd(1000, gshape = 2, u = 3, phiu = 0.2)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-1, 10))
##D lines(xx, dgammagpd(xx, gshape = 2, u = 3, phiu = 0.2))
##D 
##D plot(xx, dgammagpd(xx, gshape = 2, u = 3, xi=0, phiu = 0.2), type = "l")
##D lines(xx, dgammagpd(xx, gshape = 2, u = 3, xi=-0.2, phiu = 0.2), col = "red")
##D lines(xx, dgammagpd(xx, gshape = 2, u = 3, xi=0.2, phiu = 0.2), col = "blue")
##D legend("topright", c("xi = 0", "xi = 0.2", "xi = -0.2"),
##D   col=c("black", "red", "blue"), lty = 1)
## End(Not run)




