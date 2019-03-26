library(evmix)


### Name: fbetagpdcon
### Title: MLE Fitting of beta Bulk and GPD Tail Extreme Value Mixture
###   Model with Single Continuity Constraint
### Aliases: fbetagpdcon lbetagpdcon nlbetagpdcon proflubetagpdcon
###   nlubetagpdcon lbetagpdcon fbetagpdcon nlbetagpdcon proflubetagpdcon
###   nlubetagpdcon nlbetagpdcon fbetagpdcon lbetagpdcon proflubetagpdcon
###   nlubetagpdcon proflubetagpdcon fbetagpdcon lbetagpdcon nlbetagpdcon
###   nlubetagpdcon nlubetagpdcon fbetagpdcon lbetagpdcon nlbetagpdcon
###   proflubetagpdcon

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 1))
##D 
##D x = rbeta(1000, shape1 = 2, shape2 = 4)
##D xx = seq(-0.1, 2, 0.01)
##D y = dbeta(xx, shape1 = 2, shape2 = 4)
##D 
##D # Continuity constraint
##D fit = fbetagpdcon(x)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 2))
##D lines(xx, y)
##D with(fit, lines(xx, dbetagpdcon(xx, bshape1, bshape2, u, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D   
##D # No continuity constraint
##D fit2 = fbetagpd(x, phiu = FALSE)
##D with(fit2, lines(xx, dbetagpd(xx, bshape1, bshape2, u, sigmau, xi, phiu), col="blue"))
##D abline(v = fit2$u, col = "blue")
##D legend("topright", c("True Density","No continuity constraint","With continuty constraint"),
##D   col=c("black", "blue", "red"), lty = 1)
##D   
##D # Profile likelihood for initial value of threshold and fixed threshold approach
##D fitu = fbetagpdcon(x, useq = seq(0.3, 0.7, length = 20))
##D fitfix = fbetagpdcon(x, useq = seq(0.3, 0.7, length = 20), fixedu = TRUE)
##D 
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 2))
##D lines(xx, y)
##D with(fit, lines(xx, dbetagpdcon(xx, bshape1, bshape2, u, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D with(fitu, lines(xx, dbetagpdcon(xx, bshape1, bshape2, u, xi), col="purple"))
##D abline(v = fitu$u, col = "purple")
##D with(fitfix, lines(xx, dbetagpdcon(xx, bshape1, bshape2, u, xi), col="darkgreen"))
##D abline(v = fitfix$u, col = "darkgreen")
##D legend("topright", c("True Density","Default initial value (90% quantile)",
##D  "Prof. lik. for initial value", "Prof. lik. for fixed threshold"),
##D  col=c("black", "red", "purple", "darkgreen"), lty = 1)
## End(Not run)
  



