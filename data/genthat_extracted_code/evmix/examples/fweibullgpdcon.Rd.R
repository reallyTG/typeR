library(evmix)


### Name: fweibullgpdcon
### Title: MLE Fitting of Weibull Bulk and GPD Tail Extreme Value Mixture
###   Model with Single Continuity Constraint
### Aliases: fweibullgpdcon lweibullgpdcon nlweibullgpdcon
###   profluweibullgpdcon nluweibullgpdcon lweibullgpdcon fweibullgpdcon
###   nlweibullgpdcon profluweibullgpdcon nluweibullgpdcon nlweibullgpdcon
###   fweibullgpdcon lweibullgpdcon profluweibullgpdcon nluweibullgpdcon
###   profluweibullgpdcon fweibullgpdcon lweibullgpdcon nlweibullgpdcon
###   nluweibullgpdcon nluweibullgpdcon fweibullgpdcon lweibullgpdcon
###   nlweibullgpdcon profluweibullgpdcon

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 1))
##D 
##D x = rweibull(1000, shape = 2)
##D xx = seq(-0.1, 4, 0.01)
##D y = dweibull(xx, shape = 2)
##D 
##D # Continuity constraint
##D fit = fweibullgpdcon(x)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dweibullgpdcon(xx, wshape, wscale, u, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D   
##D # No continuity constraint
##D fit2 = fweibullgpd(x, phiu = FALSE)
##D with(fit2, lines(xx, dweibullgpd(xx, wshape, wscale, u, sigmau, xi, phiu), col="blue"))
##D abline(v = fit2$u, col = "blue")
##D legend("topright", c("True Density","No continuity constraint","With continuty constraint"),
##D   col=c("black", "blue", "red"), lty = 1)
##D   
##D # Profile likelihood for initial value of threshold and fixed threshold approach
##D fitu = fweibullgpdcon(x, useq = seq(0.5, 2, length = 20))
##D fitfix = fweibullgpdcon(x, useq = seq(0.5, 2, length = 20), fixedu = TRUE)
##D 
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dweibullgpdcon(xx, wshape, wscale, u, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D with(fitu, lines(xx, dweibullgpdcon(xx, wshape, wscale, u, xi), col="purple"))
##D abline(v = fitu$u, col = "purple")
##D with(fitfix, lines(xx, dweibullgpdcon(xx, wshape, wscale, u, xi), col="darkgreen"))
##D abline(v = fitfix$u, col = "darkgreen")
##D legend("topright", c("True Density","Default initial value (90% quantile)",
##D  "Prof. lik. for initial value", "Prof. lik. for fixed threshold"),
##D  col=c("black", "red", "purple", "darkgreen"), lty = 1)
## End(Not run)
  



