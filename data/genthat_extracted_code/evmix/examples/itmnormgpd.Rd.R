library(evmix)


### Name: itmnormgpd
### Title: Normal Bulk and GPD Tail Interval Transition Mixture Model
### Aliases: itmnormgpd ditmnormgpd pitmnormgpd qitmnormgpd ritmnormgpd
###   ditmnormgpd itmnormgpd pitmnormgpd qitmnormgpd ritmnormgpd
###   pitmnormgpd itmnormgpd ditmnormgpd qitmnormgpd ritmnormgpd
###   qitmnormgpd itmnormgpd ditmnormgpd pitmnormgpd ritmnormgpd
###   ritmnormgpd itmnormgpd ditmnormgpd pitmnormgpd qitmnormgpd

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D xx = seq(-4, 5, 0.01)
##D u = 1.5
##D epsilon = 0.4
##D kappa = 1/(1 + pnorm(u, 0, 1))
##D 
##D f = ditmnormgpd(xx, nmean = 0, nsd = 1, epsilon, u, sigmau = 1, xi = 0.5)
##D plot(xx, f, ylim = c(0, 1), xlim = c(-4, 5), type = 'l', lwd = 2, xlab = "x", ylab = "density")
##D lines(xx, kappa * dgpd(xx, u, sigmau = 1, xi = 0.5), col = "red", lty = 2, lwd = 2)
##D lines(xx, kappa * dnorm(xx, 0, 1), col = "blue", lty = 2, lwd = 2)
##D abline(v = u + epsilon * seq(-1, 1), lty = c(2, 1, 2))
##D legend('topright', c('Normal-GPD ITM', 'kappa*Normal', 'kappa*GPD'),
##D       col = c("black", "blue", "red"), lty = c(1, 2, 2), lwd = 2)
##D 
##D # cdf contributions
##D F = pitmnormgpd(xx, nmean = 0, nsd = 1, epsilon, u, sigmau = 1, xi = 0.5)
##D plot(xx, F, ylim = c(0, 1), xlim = c(-4, 5), type = 'l', lwd = 2, xlab = "x", ylab = "cdf")
##D lines(xx[xx > u], kappa * (pnorm(u, 0, 1) + pgpd(xx[xx > u], u, sigmau = 1, xi = 0.5)),
##D      col = "red", lty = 2, lwd = 2)
##D lines(xx[xx <= u], kappa * pnorm(xx[xx <= u], 0, 1), col = "blue", lty = 2, lwd = 2)
##D abline(v = u + epsilon * seq(-1, 1), lty = c(2, 1, 2))
##D legend('topleft', c('Normal-GPD ITM', 'kappa*Normal', 'kappa*GPD'),
##D       col = c("black", "blue", "red"), lty = c(1, 2, 2), lwd = 2)
##D 
##D # simulated data density histogram and overlay true density 
##D x = ritmnormgpd(10000, nmean = 0, nsd = 1, epsilon, u, sigmau = 1, xi = 0.5)
##D hist(x, freq = FALSE, breaks = seq(-4, 1000, 0.1), xlim = c(-4, 5))
##D lines(xx, ditmnormgpd(xx, nmean = 0, nsd = 1, epsilon, u, sigmau = 1, xi = 0.5),
##D   lwd = 2, col = 'black')  
## End(Not run)




