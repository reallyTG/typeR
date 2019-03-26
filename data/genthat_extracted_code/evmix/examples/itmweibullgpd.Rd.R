library(evmix)


### Name: itmweibullgpd
### Title: Weibull Bulk and GPD Tail Interval Transition Mixture Model
### Aliases: itmweibullgpd ditmweibullgpd pitmweibullgpd qitmweibullgpd
###   ritmweibullgpd ditmweibullgpd itmweibullgpd pitmweibullgpd
###   qitmweibullgpd ritmweibullgpd pitmweibullgpd itmweibullgpd
###   ditmweibullgpd qitmweibullgpd ritmweibullgpd qitmweibullgpd
###   itmweibullgpd ditmweibullgpd pitmweibullgpd ritmweibullgpd
###   ritmweibullgpd itmweibullgpd ditmweibullgpd pitmweibullgpd
###   qitmweibullgpd

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D xx = seq(0.001, 5, 0.01)
##D u = 1.5
##D epsilon = 0.4
##D kappa = 1/(1 + pweibull(u, 2, 1))
##D 
##D f = ditmweibullgpd(xx, wshape = 2, wscale = 1, epsilon, u, sigmau = 1, xi = 0.5)
##D plot(xx, f, ylim = c(0, 1), xlim = c(0, 5), type = 'l', lwd = 2, xlab = "x", ylab = "density")
##D lines(xx, kappa * dgpd(xx, u, sigmau = 1, xi = 0.5), col = "red", lty = 2, lwd = 2)
##D lines(xx, kappa * dweibull(xx, 2, 1), col = "blue", lty = 2, lwd = 2)
##D abline(v = u + epsilon * seq(-1, 1), lty = c(2, 1, 2))
##D legend('topright', c('Weibull-GPD ITM', 'kappa*Weibull', 'kappa*GPD'),
##D       col = c("black", "blue", "red"), lty = c(1, 2, 2), lwd = 2)
##D 
##D # cdf contributions
##D F = pitmweibullgpd(xx, wshape = 2, wscale = 1, epsilon, u, sigmau = 1, xi = 0.5)
##D plot(xx, F, ylim = c(0, 1), xlim = c(0, 5), type = 'l', lwd = 2, xlab = "x", ylab = "cdf")
##D lines(xx[xx > u], kappa * (pweibull(u, 2, 1) + pgpd(xx[xx > u], u, sigmau = 1, xi = 0.5)),
##D      col = "red", lty = 2, lwd = 2)
##D lines(xx[xx <= u], kappa * pweibull(xx[xx <= u], 2, 1), col = "blue", lty = 2, lwd = 2)
##D abline(v = u + epsilon * seq(-1, 1), lty = c(2, 1, 2))
##D legend('topright', c('Weibull-GPD ITM', 'kappa*Weibull', 'kappa*GPD'),
##D       col = c("black", "blue", "red"), lty = c(1, 2, 2), lwd = 2)
##D 
##D # simulated data density histogram and overlay true density 
##D x = ritmweibullgpd(10000, wshape = 2, wscale = 1, epsilon, u, sigmau = 1, xi = 0.5)
##D hist(x, freq = FALSE, breaks = seq(0, 1000, 0.1), xlim = c(0, 5))
##D lines(xx, ditmweibullgpd(xx, wshape = 2, wscale = 1, epsilon, u, sigmau = 1, xi = 0.5),
##D   lwd = 2, col = 'black')  
## End(Not run)




