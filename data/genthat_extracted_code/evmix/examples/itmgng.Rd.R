library(evmix)


### Name: itmgng
### Title: Normal Bulk with GPD Upper and Lower Tails Interval Transition
###   Mixture Model
### Aliases: itmgng ditmgng pitmgng qitmgng ritmgng ditmgng itmgng pitmgng
###   qitmgng ritmgng pitmgng itmgng ditmgng qitmgng ritmgng qitmgng itmgng
###   ditmgng pitmgng ritmgng ritmgng itmgng ditmgng pitmgng qitmgng

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 2))
##D 
##D xx = seq(-5, 5, 0.01)
##D ul = -1.5;ur = 2
##D epsilon = 0.8
##D kappa = 1/(2 + pnorm(ur, 0, 1) - pnorm(ul, 0, 1))
##D 
##D f = ditmgng(xx, nmean = 0, nsd = 1, epsilon, ul, sigmaul = 1, xil = 0.5, ur, sigmaur = 1, xir = 0.5)
##D plot(xx, f, ylim = c(0, 0.5), xlim = c(-5, 5), type = 'l', lwd = 2, xlab = "x", ylab = "density")
##D lines(xx, kappa * dgpd(-xx, -ul, sigmau = 1, xi = 0.5), col = "blue", lty = 2, lwd = 2)
##D lines(xx, kappa * dnorm(xx, 0, 1), col = "red", lty = 2, lwd = 2)
##D lines(xx, kappa * dgpd(xx, ur, sigmau = 1, xi = 0.5), col = "green", lty = 2, lwd = 2)
##D abline(v = ul + epsilon * seq(-1, 1), lty = c(2, 1, 2), col = "blue")
##D abline(v = ur + epsilon * seq(-1, 1), lty = c(2, 1, 2), col = "green")
##D legend('topright', c('Normal-GPD ITM', 'kappa*GPD Lower', 'kappa*Normal', 'kappa*GPD Upper'),
##D       col = c("black", "blue", "red", "green"), lty = c(1, 2, 2, 2), lwd = 2)
##D 
##D # cdf contributions
##D F = pitmgng(xx, nmean = 0, nsd = 1, epsilon, ul, sigmaul = 1, xil = 0.5, ur, sigmaur = 1, xir = 0.5)
##D plot(xx, F, ylim = c(0, 1), xlim = c(-5, 5), type = 'l', lwd = 2, xlab = "x", ylab = "cdf")
##D lines(xx[xx < ul], kappa * (1 - pgpd(-xx[xx < ul], -ul, 1, 0.5)), col = "blue", lty = 2, lwd = 2)
##D lines(xx[(xx >= ul) & (xx <= ur)], kappa * (1 + pnorm(xx[(xx >= ul) & (xx <= ur)], 0, 1) -
##D       pnorm(ul, 0, 1)), col = "red", lty = 2, lwd = 2)
##D lines(xx[xx > ur], kappa * (1 + (pnorm(ur, 0, 1) - pnorm(ul, 0, 1)) +
##D       pgpd(xx[xx > ur], ur, sigmau = 1, xi = 0.5)), col = "green", lty = 2, lwd = 2)
##D abline(v = ul + epsilon * seq(-1, 1), lty = c(2, 1, 2), col = "blue")
##D abline(v = ur + epsilon * seq(-1, 1), lty = c(2, 1, 2), col = "green")
##D legend('topleft', c('Normal-GPD ITM', 'kappa*GPD Lower', 'kappa*Normal', 'kappa*GPD Upper'),
##D       col = c("black", "blue", "red", "green"), lty = c(1, 2, 2, 2), lwd = 2)
##D 
##D # simulated data density histogram and overlay true density 
##D x = ritmgng(10000, nmean = 0, nsd = 1, epsilon, ul, sigmaul = 1, xil = 0.5,
##D                                                 ur, sigmaur = 1, xir = 0.5)
##D hist(x, freq = FALSE, breaks = seq(-1000, 1000, 0.1), xlim = c(-5, 5))
##D lines(xx, ditmgng(xx, nmean = 0, nsd = 1, epsilon, ul, sigmaul = 1, xil = 0.5,
##D   ur, sigmaur = 1, xir = 0.5), lwd = 2, col = 'black')
## End(Not run)




