library(evmix)


### Name: fhpdcon
### Title: MLE Fitting of Hybrid Pareto Extreme Value Mixture Model with
###   Single Continuity Constraint
### Aliases: fhpdcon lhpdcon nlhpdcon profluhpdcon nluhpdcon lhpdcon
###   fhpdcon nlhpdcon profluhpdcon nluhpdcon nlhpdcon fhpdcon lhpdcon
###   profluhpdcon nluhpdcon profluhpdcon fhpdcon lhpdcon nlhpdcon
###   nluhpdcon nluhpdcon fhpdcon lhpdcon nlhpdcon profluhpdcon

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 1))
##D 
##D x = rnorm(1000)
##D xx = seq(-4, 4, 0.01)
##D y = dnorm(xx)
##D 
##D # Hybrid Pareto provides reasonable fit for some asymmetric heavy upper tailed distributions
##D # but not for cases such as the normal distribution
##D 
##D # Continuity constraint
##D fit = fhpdcon(x)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dhpdcon(xx, nmean, nsd, u, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D   
##D # No continuity constraint
##D fit2 = fhpd(x)
##D with(fit2, lines(xx, dhpd(xx, nmean, nsd, xi), col="blue"))
##D abline(v = fit2$u, col = "blue")
##D legend("topleft", c("True Density","No continuity constraint","With continuty constraint"),
##D   col=c("black", "blue", "red"), lty = 1)
##D   
##D # Profile likelihood for initial value of threshold and fixed threshold approach
##D fitu = fhpdcon(x, useq = seq(-2, 2, length = 20))
##D fitfix = fhpdcon(x, useq = seq(-2, 2, length = 20), fixedu = TRUE)
##D 
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dhpdcon(xx, nmean, nsd, u, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D with(fitu, lines(xx, dhpdcon(xx, nmean, nsd, u, xi), col="purple"))
##D abline(v = fitu$u, col = "purple")
##D with(fitfix, lines(xx, dhpdcon(xx, nmean, nsd, u, xi), col="darkgreen"))
##D abline(v = fitfix$u, col = "darkgreen")
##D legend("topleft", c("True Density","Default initial value (90% quantile)",
##D  "Prof. lik. for initial value", "Prof. lik. for fixed threshold"),
##D  col=c("black", "red", "purple", "darkgreen"), lty = 1)
##D   
##D # Notice that if tail fraction is included a better fit is obtained
##D fittailfrac = fnormgpdcon(x)
##D 
##D par(mfrow = c(1, 1))
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dhpdcon(xx, nmean, nsd, u, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D with(fittailfrac, lines(xx, dnormgpdcon(xx, nmean, nsd, u, xi), col="blue"))
##D abline(v = fittailfrac$u)
##D legend("topright", c("Standard Normal", "Hybrid Pareto Continuous", "Normal+GPD Continuous"),
##D   col=c("black", "red", "blue"), lty = 1)
## End(Not run)




