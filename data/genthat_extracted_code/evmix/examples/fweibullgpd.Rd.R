library(evmix)


### Name: fweibullgpd
### Title: MLE Fitting of Weibull Bulk and GPD Tail Extreme Value Mixture
###   Model
### Aliases: fweibullgpd lweibullgpd nlweibullgpd profluweibullgpd
###   nluweibullgpd lweibullgpd fweibullgpd nlweibullgpd profluweibullgpd
###   nluweibullgpd nlweibullgpd fweibullgpd lweibullgpd profluweibullgpd
###   nluweibullgpd profluweibullgpd fweibullgpd lweibullgpd nlweibullgpd
###   nluweibullgpd nluweibullgpd fweibullgpd lweibullgpd nlweibullgpd
###   profluweibullgpd

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 1))
##D 
##D x = rweibull(1000, shape = 2)
##D xx = seq(-0.1, 4, 0.01)
##D y = dweibull(xx, shape = 2)
##D 
##D # Bulk model based tail fraction
##D fit = fweibullgpd(x)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dweibullgpd(xx, wshape, wscale, u, sigmau, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D   
##D # Parameterised tail fraction
##D fit2 = fweibullgpd(x, phiu = FALSE)
##D with(fit2, lines(xx, dweibullgpd(xx, wshape, wscale, u, sigmau, xi, phiu), col="blue"))
##D abline(v = fit2$u, col = "blue")
##D legend("topright", c("True Density","Bulk Tail Fraction","Parameterised Tail Fraction"),
##D   col=c("black", "red", "blue"), lty = 1)
##D   
##D # Profile likelihood for initial value of threshold and fixed threshold approach
##D fitu = fweibullgpd(x, useq = seq(0.5, 2, length = 20))
##D fitfix = fweibullgpd(x, useq = seq(0.5, 2, length = 20), fixedu = TRUE)
##D 
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dweibullgpd(xx, wshape, wscale, u, sigmau, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D with(fitu, lines(xx, dweibullgpd(xx, wshape, wscale, u, sigmau, xi), col="purple"))
##D abline(v = fitu$u, col = "purple")
##D with(fitfix, lines(xx, dweibullgpd(xx, wshape, wscale, u, sigmau, xi), col="darkgreen"))
##D abline(v = fitfix$u, col = "darkgreen")
##D legend("topright", c("True Density","Default initial value (90% quantile)",
##D  "Prof. lik. for initial value", "Prof. lik. for fixed threshold"),
##D  col=c("black", "red", "purple", "darkgreen"), lty = 1)
## End(Not run)
  



