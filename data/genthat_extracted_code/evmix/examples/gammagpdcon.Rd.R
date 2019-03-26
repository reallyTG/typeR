library(evmix)


### Name: gammagpdcon
### Title: Gamma Bulk and GPD Tail Extreme Value Mixture Model with Single
###   Continuity Constraint
### Aliases: gammagpdcon dgammagpdcon pgammagpdcon qgammagpdcon
###   rgammagpdcon dgammagpdcon gammagpdcon pgammagpdcon qgammagpdcon
###   rgammagpdcon pgammagpdcon gammagpdcon dgammagpdcon qgammagpdcon
###   rgammagpdcon qgammagpdcon gammagpdcon dgammagpdcon pgammagpdcon
###   rgammagpdcon rgammagpdcon gammagpdcon dgammagpdcon pgammagpdcon
###   qgammagpdcon

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D x = rgammagpdcon(1000, gshape = 2)
##D xx = seq(-1, 10, 0.01)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-1, 10))
##D lines(xx, dgammagpdcon(xx, gshape = 2))
##D 
##D # three tail behaviours
##D plot(xx, pgammagpdcon(xx, gshape = 2), type = "l")
##D lines(xx, pgammagpdcon(xx, gshape = 2, xi = 0.3), col = "red")
##D lines(xx, pgammagpdcon(xx, gshape = 2, xi = -0.3), col = "blue")
##D legend("bottomright", paste("xi =",c(0, 0.3, -0.3)),
##D   col=c("black", "red", "blue"), lty = 1)
##D 
##D x = rgammagpdcon(1000, gshape = 2, u = 3, phiu = 0.2)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-1, 10))
##D lines(xx, dgammagpdcon(xx, gshape = 2, u = 3, phiu = 0.2))
##D 
##D plot(xx, dgammagpdcon(xx, gshape = 2, u = 3, xi=0, phiu = 0.2), type = "l")
##D lines(xx, dgammagpdcon(xx, gshape = 2, u = 3, xi=-0.2, phiu = 0.2), col = "red")
##D lines(xx, dgammagpdcon(xx, gshape = 2, u = 3, xi=0.2, phiu = 0.2), col = "blue")
##D legend("topright", c("xi = 0", "xi = 0.2", "xi = -0.2"),
##D   col=c("black", "red", "blue"), lty = 1)
## End(Not run)




