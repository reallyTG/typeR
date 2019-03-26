library(evmix)


### Name: fnormgpdcon
### Title: MLE Fitting of Normal Bulk and GPD Tail Extreme Value Mixture
###   Model with Single Continuity Constraint
### Aliases: fnormgpdcon lnormgpdcon nlnormgpdcon proflunormgpdcon
###   nlunormgpdcon lnormgpdcon fnormgpdcon nlnormgpdcon proflunormgpdcon
###   nlunormgpdcon nlnormgpdcon fnormgpdcon lnormgpdcon proflunormgpdcon
###   nlunormgpdcon proflunormgpdcon fnormgpdcon lnormgpdcon nlnormgpdcon
###   nlunormgpdcon nlunormgpdcon fnormgpdcon lnormgpdcon nlnormgpdcon
###   proflunormgpdcon

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
##D fit = fnormgpdcon(x)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dnormgpdcon(xx, nmean, nsd, u, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D   
##D # No continuity constraint
##D fit2 = fnormgpd(x)
##D with(fit2, lines(xx, dnormgpd(xx, nmean, nsd, u, sigmau, xi), col="blue"))
##D abline(v = fit2$u, col = "blue")
##D legend("topleft", c("True Density","No continuity constraint","With continuty constraint"),
##D   col=c("black", "blue", "red"), lty = 1)
##D   
##D # Profile likelihood for initial value of threshold and fixed threshold approach
##D fitu = fnormgpdcon(x, useq = seq(0, 3, length = 20))
##D fitfix = fnormgpdcon(x, useq = seq(0, 3, length = 20), fixedu = TRUE)
##D 
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dnormgpdcon(xx, nmean, nsd, u, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D with(fitu, lines(xx, dnormgpdcon(xx, nmean, nsd, u, xi), col="purple"))
##D abline(v = fitu$u, col = "purple")
##D with(fitfix, lines(xx, dnormgpdcon(xx, nmean, nsd, u, xi), col="darkgreen"))
##D abline(v = fitfix$u, col = "darkgreen")
##D legend("topleft", c("True Density","Default initial value (90% quantile)",
##D  "Prof. lik. for initial value", "Prof. lik. for fixed threshold"),
##D  col=c("black", "red", "purple", "darkgreen"), lty = 1)
## End(Not run)
  



