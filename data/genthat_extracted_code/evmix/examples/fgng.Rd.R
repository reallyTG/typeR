library(evmix)


### Name: fgng
### Title: MLE Fitting of Normal Bulk and GPD for Both Tails Extreme Value
###   Mixture Model
### Aliases: fgng lgng nlgng proflugng nlugng lgng fgng nlgng proflugng
###   nlugng nlgng fgng lgng proflugng nlugng proflugng fgng lgng nlgng
###   nlugng nlugng fgng lgng nlgng proflugng

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
##D fit = fgng(x)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dgng(xx, nmean, nsd, ul, sigmaul, xil, phiul, 
##D    ur, sigmaur, xir, phiur), col="red"))
##D abline(v = c(fit$ul, fit$ur), col = "red")
##D   
##D # Parameterised tail fraction
##D fit2 = fgng(x, phiul = FALSE, phiur = FALSE)
##D with(fit2, lines(xx, dgng(xx, nmean, nsd, ul, sigmaul, xil, phiul,
##D    ur, sigmaur, xir, phiur), col="blue"))
##D abline(v = c(fit2$ul, fit2$ur), col = "blue")
##D legend("topright", c("True Density","Bulk Tail Fraction","Parameterised Tail Fraction"),
##D   col=c("black", "red", "blue"), lty = 1)
##D   
##D # Profile likelihood for initial value of threshold and fixed threshold approach
##D fitu = fgng(x, ulseq = seq(-2, -0.2, length = 10), 
##D  urseq = seq(0.2, 2, length = 10))
##D fitfix = fgng(x, ulseq = seq(-2, -0.2, length = 10), 
##D  urseq = seq(0.2, 2, length = 10), fixedu = TRUE)
##D 
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dgng(xx, nmean, nsd, ul, sigmaul, xil, phiul,
##D    ur, sigmaur, xir, phiur), col="red"))
##D abline(v = c(fit$ul, fit$ur), col = "red")
##D with(fitu, lines(xx, dgng(xx, nmean, nsd, ul, sigmaul, xil, phiul,
##D    ur, sigmaur, xir, phiur), col="purple"))
##D abline(v = c(fitu$ul, fitu$ur), col = "purple")
##D with(fitfix, lines(xx, dgng(xx, nmean, nsd, ul, sigmaul, xil, phiul,
##D    ur, sigmaur, xir, phiur), col="darkgreen"))
##D abline(v = c(fitfix$ul, fitfix$ur), col = "darkgreen")
##D legend("topright", c("True Density","Default initial value (90% quantile)",
##D  "Prof. lik. for initial value", "Prof. lik. for fixed threshold"),
##D  col=c("black", "red", "purple", "darkgreen"), lty = 1)
## End(Not run)
  



