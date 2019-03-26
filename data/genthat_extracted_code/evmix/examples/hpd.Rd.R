library(evmix)


### Name: hpd
### Title: Hybrid Pareto Extreme Value Mixture Model
### Aliases: hpd dhpd phpd qhpd rhpd dhpd hpd phpd qhpd rhpd phpd hpd dhpd
###   qhpd rhpd qhpd hpd dhpd phpd rhpd rhpd hpd dhpd phpd qhpd

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D xx = seq(-5, 20, 0.01)
##D f1 = dhpd(xx, nmean = 0, nsd = 1, xi = 0.4)
##D plot(xx, f1, type = "l")
##D abline(v = 0.4942921)
##D 
##D # three tail behaviours
##D plot(xx, phpd(xx), type = "l")
##D lines(xx, phpd(xx, xi = 0.3), col = "red")
##D lines(xx, phpd(xx, xi = -0.3), col = "blue")
##D legend("bottomright", paste("xi =",c(0, 0.3, -0.3)),
##D   col=c("black", "red", "blue"), lty = 1)
##D  
##D sim = rhpd(10000, nmean = 0, nsd = 1.5, xi = 0.2)
##D hist(sim, freq = FALSE, 100, xlim = c(-5, 20), ylim = c(0, 0.2))
##D lines(xx, dhpd(xx, nmean = 0, nsd = 1.5, xi = 0.2), col = "blue")
##D 
##D plot(xx, dhpd(xx, nmean = 0, nsd = 1.5, xi = 0), type = "l")
##D lines(xx, dhpd(xx, nmean = 0, nsd = 1.5, xi = 0.2), col = "red")
##D lines(xx, dhpd(xx, nmean = 0, nsd = 1.5, xi = -0.2), col = "blue")
##D legend("topright", c("xi = 0", "xi = 0.2", "xi = -0.2"),
##D   col=c("black", "red", "blue"), lty = 1)
## End(Not run)




