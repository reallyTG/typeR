library(evmix)


### Name: hpdcon
### Title: Hybrid Pareto Extreme Value Mixture Model with Single Continuity
###   Constraint
### Aliases: hpdcon dhpdcon phpdcon qhpdcon rhpdcon dhpdcon hpdcon phpdcon
###   qhpdcon rhpdcon phpdcon hpdcon dhpdcon qhpdcon rhpdcon qhpdcon hpdcon
###   dhpdcon phpdcon rhpdcon rhpdcon hpdcon dhpdcon phpdcon qhpdcon

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D xx = seq(-5, 20, 0.01)
##D f1 = dhpdcon(xx, nmean = 0, nsd = 1.5, u = 1, xi = 0.4)
##D plot(xx, f1, type = "l")
##D abline(v = 4)
##D 
##D # three tail behaviours
##D plot(xx, phpdcon(xx), type = "l")
##D lines(xx, phpdcon(xx, xi = 0.3), col = "red")
##D lines(xx, phpdcon(xx, xi = -0.3), col = "blue")
##D legend("bottomright", paste("xi =",c(0, 0.3, -0.3)),
##D   col=c("black", "red", "blue"), lty = 1)
##D  
##D sim = rhpdcon(10000, nmean = 0, nsd = 1.5, u = 1, xi = 0.2)
##D hist(sim, freq = FALSE, 100, xlim = c(-5, 20), ylim = c(0, 0.2))
##D lines(xx, dhpdcon(xx, nmean = 0, nsd = 1.5, u = 1, xi = 0.2), col = "blue")
##D 
##D plot(xx, dhpdcon(xx, nmean = 0, nsd = 1.5, u = 1, xi = 0), type = "l")
##D lines(xx, dhpdcon(xx, nmean = 0, nsd = 1.5, u = 1, xi = 0.2), col = "red")
##D lines(xx, dhpdcon(xx, nmean = 0, nsd = 1.5, u = 1, xi = -0.2), col = "blue")
##D legend("topright", c("xi = 0", "xi = 0.2", "u = 1, xi = -0.2"),
##D   col=c("black", "red", "blue"), lty = 1)
## End(Not run)




