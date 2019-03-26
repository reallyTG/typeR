library(evmix)


### Name: fbckdengpdcon
### Title: MLE Fitting of Boundary Corrected Kernel Density Estimate for
###   Bulk and GPD Tail Extreme Value Mixture Model with Single Continuity
###   Constraint
### Aliases: fbckdengpdcon lbckdengpdcon nlbckdengpdcon proflubckdengpdcon
###   nlubckdengpdcon lbckdengpdcon fbckdengpdcon nlbckdengpdcon
###   proflubckdengpdcon nlubckdengpdcon nlbckdengpdcon fbckdengpdcon
###   lbckdengpdcon proflubckdengpdcon nlubckdengpdcon proflubckdengpdcon
###   fbckdengpdcon lbckdengpdcon nlbckdengpdcon nlubckdengpdcon
###   nlubckdengpdcon fbckdengpdcon lbckdengpdcon nlbckdengpdcon
###   proflubckdengpdcon

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 1))
##D 
##D x = rgamma(500, 2, 1)
##D xx = seq(-0.1, 10, 0.01)
##D y = dgamma(xx, 2, 1)
##D 
##D # Continuity constraint
##D pinit = c(0.1, quantile(x, 0.9), 0.1) # initial values required for BCKDE
##D fit = fbckdengpdcon(x, pvector = pinit, bcmethod = "cutnorm")
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 10))
##D lines(xx, y)
##D with(fit, lines(xx, dbckdengpdcon(xx, x, lambda, u, xi, bcmethod = "cutnorm"), col="red"))
##D abline(v = fit$u, col = "red")
##D   
##D # No continuity constraint
##D pinit = c(0.1, quantile(x, 0.9), 1, 0.1) # initial values required for BCKDE
##D fit2 = fbckdengpd(x, pvector = pinit, bcmethod = "cutnorm")
##D with(fit2, lines(xx, dbckdengpd(xx, x, lambda, u, sigmau, xi, bc = "cutnorm"), col="blue"))
##D abline(v = fit2$u, col = "blue")
##D legend("topright", c("True Density","No continuity constraint","With continuty constraint"),
##D   col=c("black", "blue", "red"), lty = 1)
##D   
##D # Profile likelihood for initial value of threshold and fixed threshold approach
##D pinit = c(0.1, 0.1) # notice threshold dropped from initial values
##D fitu = fbckdengpdcon(x, useq = seq(1, 6, length = 20), pvector = pinit, bcmethod = "cutnorm")
##D fitfix = fbckdengpdcon(x, useq = seq(1, 6, length = 20), fixedu = TRUE, pv = pinit, bc = "cutnorm")
##D 
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 10))
##D lines(xx, y)
##D with(fit, lines(xx, dbckdengpdcon(xx, x, lambda, u, xi, bc = "cutnorm"), col="red"))
##D abline(v = fit$u, col = "red")
##D with(fitu, lines(xx, dbckdengpdcon(xx, x, lambda, u, xi, bc = "cutnorm"), col="purple"))
##D abline(v = fitu$u, col = "purple")
##D with(fitfix, lines(xx, dbckdengpdcon(xx, x, lambda, u, xi, bc = "cutnorm"), col="darkgreen"))
##D abline(v = fitfix$u, col = "darkgreen")
##D legend("topright", c("True Density","Default initial value (90% quantile)",
##D  "Prof. lik. for initial value", "Prof. lik. for fixed threshold"),
##D  col=c("black", "red", "purple", "darkgreen"), lty = 1)
## End(Not run)




