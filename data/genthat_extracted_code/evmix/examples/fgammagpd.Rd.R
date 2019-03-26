library(evmix)


### Name: fgammagpd
### Title: MLE Fitting of Gamma Bulk and GPD Tail Extreme Value Mixture
###   Model
### Aliases: fgammagpd lgammagpd nlgammagpd proflugammagpd nlugammagpd
###   lgammagpd fgammagpd nlgammagpd proflugammagpd nlugammagpd nlgammagpd
###   fgammagpd lgammagpd proflugammagpd nlugammagpd proflugammagpd
###   fgammagpd lgammagpd nlgammagpd nlugammagpd nlugammagpd fgammagpd
###   lgammagpd nlgammagpd proflugammagpd

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 1))
##D 
##D x = rgamma(1000, shape = 2)
##D xx = seq(-0.1, 8, 0.01)
##D y = dgamma(xx, shape = 2)
##D 
##D # Bulk model based tail fraction
##D fit = fgammagpd(x)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 8))
##D lines(xx, y)
##D with(fit, lines(xx, dgammagpd(xx, gshape, gscale, u, sigmau, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D   
##D # Parameterised tail fraction
##D fit2 = fgammagpd(x, phiu = FALSE)
##D with(fit2, lines(xx, dgammagpd(xx, gshape, gscale, u, sigmau, xi, phiu), col="blue"))
##D abline(v = fit2$u, col = "blue")
##D legend("topright", c("True Density","Bulk Tail Fraction","Parameterised Tail Fraction"),
##D   col=c("black", "red", "blue"), lty = 1)
##D   
##D # Profile likelihood for initial value of threshold and fixed threshold approach
##D fitu = fgammagpd(x, useq = seq(1, 5, length = 20))
##D fitfix = fgammagpd(x, useq = seq(1, 5, length = 20), fixedu = TRUE)
##D 
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 8))
##D lines(xx, y)
##D with(fit, lines(xx, dgammagpd(xx, gshape, gscale, u, sigmau, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D with(fitu, lines(xx, dgammagpd(xx, gshape, gscale, u, sigmau, xi), col="purple"))
##D abline(v = fitu$u, col = "purple")
##D with(fitfix, lines(xx, dgammagpd(xx, gshape, gscale, u, sigmau, xi), col="darkgreen"))
##D abline(v = fitfix$u, col = "darkgreen")
##D legend("topright", c("True Density","Default initial value (90% quantile)",
##D  "Prof. lik. for initial value", "Prof. lik. for fixed threshold"),
##D  col=c("black", "red", "purple", "darkgreen"), lty = 1)
## End(Not run)
  



