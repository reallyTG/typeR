library(evmix)


### Name: fgkgcon
### Title: MLE Fitting of Kernel Density Estimate for Bulk and GPD for Both
###   Tails with Single Continuity Constraint at Both Thresholds Extreme
###   Value Mixture Model
### Aliases: fgkgcon lgkgcon nlgkgcon proflugkgcon nlugkgcon lgkgcon
###   fgkgcon nlgkgcon proflugkgcon nlugkgcon nlgkgcon fgkgcon lgkgcon
###   proflugkgcon nlugkgcon proflugkgcon fgkgcon lgkgcon nlgkgcon
###   nlugkgcon nlugkgcon fgkgcon lgkgcon nlgkgcon proflugkgcon

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 1))
##D 
##D x = rnorm(1000)
##D xx = seq(-4, 4, 0.01)
##D y = dnorm(xx)
##D 
##D # Continuity constraint
##D fit = fgkgcon(x)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dgkgcon(xx, x, lambda, ul, xil, phiul,
##D    ur, xir, phiur), col="red"))
##D abline(v = c(fit$ul, fit$ur), col = "red")
##D   
##D # No continuity constraint
##D fit2 = fgkg(x)
##D with(fit2, lines(xx, dgkg(xx, x, lambda, ul, sigmaul, xil, phiul,
##D    ur, sigmaur, xir, phiur), col="blue"))
##D abline(v = c(fit2$ul, fit2$ur), col = "blue")
##D legend("topleft", c("True Density","No continuity constraint","With continuty constraint"),
##D   col=c("black", "blue", "red"), lty = 1)
##D   
##D # Profile likelihood for initial value of threshold and fixed threshold approach
##D fitu = fgkgcon(x, ulseq = seq(-2, -0.2, length = 10), 
##D  urseq = seq(0.2, 2, length = 10))
##D fitfix = fgkgcon(x, ulseq = seq(-2, -0.2, length = 10), 
##D  urseq = seq(0.2, 2, length = 10), fixedu = TRUE)
##D 
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dgkgcon(xx, x, lambda, ul, xil, phiul,
##D    ur, xir, phiur), col="red"))
##D abline(v = c(fit$ul, fit$ur), col = "red")
##D with(fitu, lines(xx, dgkgcon(xx, x, lambda, ul, xil, phiul,
##D    ur, xir, phiur), col="purple"))
##D abline(v = c(fitu$ul, fitu$ur), col = "purple")
##D with(fitfix, lines(xx, dgkgcon(xx, x, lambda, ul, xil, phiul,
##D    ur, xir, phiur), col="darkgreen"))
##D abline(v = c(fitfix$ul, fitfix$ur), col = "darkgreen")
##D legend("topright", c("True Density","Default initial value (90% quantile)",
##D  "Prof. lik. for initial value", "Prof. lik. for fixed threshold"),
##D  col=c("black", "red", "purple", "darkgreen"), lty = 1)
## End(Not run)
  



