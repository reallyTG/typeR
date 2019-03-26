library(evmix)


### Name: flognormgpdcon
### Title: MLE Fitting of log-normal Bulk and GPD Tail Extreme Value
###   Mixture Model with Single Continuity Constraint
### Aliases: flognormgpdcon llognormgpdcon nllognormgpdcon
###   proflulognormgpdcon nlulognormgpdcon llognormgpdcon flognormgpdcon
###   nllognormgpdcon proflulognormgpdcon nlulognormgpdcon nllognormgpdcon
###   flognormgpdcon llognormgpdcon proflulognormgpdcon nlulognormgpdcon
###   proflulognormgpdcon flognormgpdcon llognormgpdcon nllognormgpdcon
###   nlulognormgpdcon nlulognormgpdcon flognormgpdcon llognormgpdcon
###   nllognormgpdcon proflulognormgpdcon

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 1))
##D 
##D x = rlnorm(1000)
##D xx = seq(-0.1, 10, 0.01)
##D y = dlnorm(xx)
##D 
##D # Continuity constraint
##D fit = flognormgpdcon(x)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 10), ylim = c(0, 0.8))
##D lines(xx, y)
##D with(fit, lines(xx, dlognormgpdcon(xx, lnmean, lnsd, u, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D   
##D # No continuity constraint
##D fit2 = flognormgpd(x, phiu = FALSE)
##D with(fit2, lines(xx, dlognormgpd(xx, lnmean, lnsd, u, sigmau, xi, phiu), col="blue"))
##D abline(v = fit2$u, col = "blue")
##D legend("topright", c("True Density","No continuity constraint","With continuty constraint"),
##D   col=c("black", "blue", "red"), lty = 1)
##D   
##D # Profile likelihood for initial value of threshold and fixed threshold approach
##D fitu = flognormgpdcon(x, useq = seq(1, 5, length = 20))
##D fitfix = flognormgpdcon(x, useq = seq(1, 5, length = 20), fixedu = TRUE)
##D 
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 10), ylim = c(0, 0.8))
##D lines(xx, y)
##D with(fit, lines(xx, dlognormgpdcon(xx, lnmean, lnsd, u, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D with(fitu, lines(xx, dlognormgpdcon(xx, lnmean, lnsd, u, xi), col="purple"))
##D abline(v = fitu$u, col = "purple")
##D with(fitfix, lines(xx, dlognormgpdcon(xx, lnmean, lnsd, u, xi), col="darkgreen"))
##D abline(v = fitfix$u, col = "darkgreen")
##D legend("topright", c("True Density","Default initial value (90% quantile)",
##D  "Prof. lik. for initial value", "Prof. lik. for fixed threshold"),
##D  col=c("black", "red", "purple", "darkgreen"), lty = 1)
## End(Not run)
  



