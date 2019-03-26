library(evmix)


### Name: fgkg
### Title: MLE Fitting of Kernel Density Estimate for Bulk and GPD for Both
###   Tails Extreme Value Mixture Model
### Aliases: fgkg lgkg nlgkg proflugkg nlugkg lgkg fgkg nlgkg proflugkg
###   nlugkg nlgkg fgkg lgkg proflugkg nlugkg proflugkg fgkg lgkg nlgkg
###   nlugkg nlugkg fgkg lgkg nlgkg proflugkg

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(2, 1))
##D 
##D x = rnorm(1000)
##D xx = seq(-4, 4, 0.01)
##D y = dnorm(xx)
##D 
##D # Bulk model based tail fraction
##D fit = fgkg(x)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dgkg(xx, x, lambda, ul, sigmaul, xil, phiul,
##D    ur, sigmaur, xir, phiur), col="red"))
##D abline(v = c(fit$ul, fit$ur), col = "red")
##D   
##D # Parameterised tail fraction
##D fit2 = fgkg(x, phiul = FALSE, phiur = FALSE)
##D with(fit2, lines(xx, dgkg(xx, x, lambda, ul, sigmaul, xil, phiul,
##D    ur, sigmaur, xir, phiur), col="blue"))
##D abline(v = c(fit2$ul, fit2$ur), col = "blue")
##D legend("topright", c("True Density","Bulk Tail Fraction","Parameterised Tail Fraction"),
##D   col=c("black", "red", "blue"), lty = 1)
##D   
##D # Profile likelihood for initial value of threshold and fixed threshold approach
##D fitu = fgkg(x, ulseq = seq(-2, -0.2, length = 10), 
##D  urseq = seq(0.2, 2, length = 10))
##D fitfix = fgkg(x, ulseq = seq(-2, -0.2, length = 10), 
##D  urseq = seq(0.2, 2, length = 10), fixedu = TRUE)
##D 
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dgkg(xx, x, lambda, ul, sigmaul, xil, phiul,
##D    ur, sigmaur, xir, phiur), col="red"))
##D abline(v = c(fit$ul, fit$ur), col = "red")
##D with(fitu, lines(xx, dgkg(xx, x, lambda, ul, sigmaul, xil, phiul,
##D    ur, sigmaur, xir, phiur), col="purple"))
##D abline(v = c(fitu$ul, fitu$ur), col = "purple")
##D with(fitfix, lines(xx, dgkg(xx, x, lambda, ul, sigmaul, xil, phiul,
##D    ur, sigmaur, xir, phiur), col="darkgreen"))
##D abline(v = c(fitfix$ul, fitfix$ur), col = "darkgreen")
##D legend("topright", c("True Density","Default initial value (90% quantile)",
##D  "Prof. lik. for initial value", "Prof. lik. for fixed threshold"),
##D  col=c("black", "red", "purple", "darkgreen"), lty = 1)
## End(Not run)
  



