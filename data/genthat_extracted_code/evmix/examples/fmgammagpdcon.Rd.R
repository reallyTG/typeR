library(evmix)


### Name: fmgammagpdcon
### Title: MLE Fitting of Mixture of Gammas Bulk and GPD Tail Extreme Value
###   Mixture Model with Single Continuity Constraint using the EM
###   algorithm.
### Aliases: fmgammagpdcon lmgammagpdcon nlmgammagpdcon nlumgammagpdcon
###   proflumgammagpdcon nlEMmgammagpdcon nluEMmgammagpdcon lmgammagpdcon
###   fmgammagpdcon nlmgammagpdcon nlumgammagpdcon proflumgammagpdcon
###   nlEMmgammagpdcon nluEMmgammagpdcon nlmgammagpdcon fmgammagpdcon
###   lmgammagpdcon nlumgammagpdcon proflumgammagpdcon nlEMmgammagpdcon
###   nluEMmgammagpdcon nlumgammagpdcon fmgammagpdcon lmgammagpdcon
###   nlmgammagpdcon proflumgammagpdcon nlEMmgammagpdcon nluEMmgammagpdcon
###   nlEMmgammagpdcon fmgammagpdcon lmgammagpdcon nlmgammagpdcon
###   nlumgammagpdcon proflumgammagpdcon nluEMmgammagpdcon
###   proflumgammagpdcon fmgammagpdcon lmgammagpdcon nlmgammagpdcon
###   nlumgammagpdcon nlEMmgammagpdcon nluEMmgammagpdcon nluEMmgammagpdcon
###   fmgammagpdcon lmgammagpdcon nlmgammagpdcon nlumgammagpdcon
###   proflumgammagpdcon nlEMmgammagpdcon

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 1))
##D 
##D n=1000
##D x = c(rgamma(n*0.25, shape = 1, scale = 1), rgamma(n*0.75, shape = 6, scale = 2))
##D xx = seq(-1, 40, 0.01)
##D y = (0.25*dgamma(xx, shape = 1, scale = 1) + 0.75 * dgamma(xx, shape = 6, scale = 2))
##D 
##D # Bulk model based tail fraction
##D # very sensitive to initial values, so best to provide sensible ones
##D fit.noinit = fmgammagpdcon(x, M = 2)
##D fit.withinit = fmgammagpdcon(x, M = 2, pvector = c(1, 6, 1, 2, 0.5, 15, 0.1))
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-1, 40))
##D lines(xx, y)
##D with(fit.noinit, lines(xx, dmgammagpdcon(xx, mgshape, mgscale, mgweight, u, xi), col="red"))
##D abline(v = fit.noinit$u, col = "red")
##D with(fit.withinit, lines(xx, dmgammagpdcon(xx, mgshape, mgscale, mgweight, u, xi), col="green"))
##D abline(v = fit.withinit$u, col = "green")
##D   
##D # Parameterised tail fraction
##D fit2 = fmgammagpdcon(x, M = 2, phiu = FALSE, pvector = c(1, 6, 1, 2, 0.5, 15, 0.1))
##D with(fit2, lines(xx, dmgammagpdcon(xx, mgshape, mgscale, mgweight, u, xi, phiu), col="blue"))
##D abline(v = fit2$u, col = "blue")
##D legend("topright", c("True Density","Default pvector", "Sensible pvector",
##D  "Parameterised Tail Fraction"), col=c("black", "red", "green", "blue"), lty = 1)
##D   
##D # Fixed threshold approach
##D fitfix = fmgammagpdcon(x, M = 2, useq = 15, fixedu = TRUE,
##D    pvector = c(1, 6, 1, 2, 0.5, 0.1))
##D 
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-1, 40))
##D lines(xx, y)
##D with(fit.withinit, lines(xx, dmgammagpdcon(xx, mgshape, mgscale, mgweight, u, xi), col="red"))
##D abline(v = fit.withinit$u, col = "red")
##D with(fitfix, lines(xx, dmgammagpdcon(xx,mgshape, mgscale, mgweight, u, xi), col="darkgreen"))
##D abline(v = fitfix$u, col = "darkgreen")
##D legend("topright", c("True Density", "Default initial value (90% quantile)",
##D  "Fixed threshold approach"), col=c("black", "red", "darkgreen"), lty = 1)
## End(Not run)
  



