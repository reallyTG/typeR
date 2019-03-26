library(evmix)


### Name: fbetagpd
### Title: MLE Fitting of beta Bulk and GPD Tail Extreme Value Mixture
###   Model
### Aliases: fbetagpd lbetagpd nlbetagpd proflubetagpd nlubetagpd lbetagpd
###   fbetagpd nlbetagpd proflubetagpd nlubetagpd nlbetagpd fbetagpd
###   lbetagpd proflubetagpd nlubetagpd proflubetagpd fbetagpd lbetagpd
###   nlbetagpd nlubetagpd nlubetagpd fbetagpd lbetagpd nlbetagpd
###   proflubetagpd

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 1))
##D 
##D x = rbeta(1000, shape1 = 2, shape2 = 4)
##D xx = seq(-0.1, 2, 0.01)
##D y = dbeta(xx, shape1 = 2, shape2 = 4)
##D 
##D # Bulk model based tail fraction
##D fit = fbetagpd(x)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 2))
##D lines(xx, y)
##D with(fit, lines(xx, dbetagpd(xx, bshape1, bshape2, u, sigmau, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D   
##D # Parameterised tail fraction
##D fit2 = fbetagpd(x, phiu = FALSE)
##D with(fit2, lines(xx, dbetagpd(xx, bshape1, bshape2, u, sigmau, xi, phiu), col="blue"))
##D abline(v = fit2$u, col = "blue")
##D legend("topright", c("True Density","Bulk Tail Fraction","Parameterised Tail Fraction"),
##D   col=c("black", "red", "blue"), lty = 1)
##D   
##D # Profile likelihood for initial value of threshold and fixed threshold approach
##D fitu = fbetagpd(x, useq = seq(0.3, 0.7, length = 20))
##D fitfix = fbetagpd(x, useq = seq(0.3, 0.7, length = 20), fixedu = TRUE)
##D 
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 2))
##D lines(xx, y)
##D with(fit, lines(xx, dbetagpd(xx, bshape1, bshape2, u, sigmau, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D with(fitu, lines(xx, dbetagpd(xx, bshape1, bshape2, u, sigmau, xi), col="purple"))
##D abline(v = fitu$u, col = "purple")
##D with(fitfix, lines(xx, dbetagpd(xx, bshape1, bshape2, u, sigmau, xi), col="darkgreen"))
##D abline(v = fitfix$u, col = "darkgreen")
##D legend("topright", c("True Density","Default initial value (90% quantile)",
##D  "Prof. lik. for initial value", "Prof. lik. for fixed threshold"),
##D  col=c("black", "red", "purple", "darkgreen"), lty = 1)
## End(Not run)
  



