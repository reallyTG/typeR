library(evmix)


### Name: fitmgng
### Title: MLE Fitting of Normal Bulk and GPD for Both Tails Interval
###   Transition Mixture Model
### Aliases: fitmgng litmgng nlitmgng profluitmgng nluitmgng litmgng
###   fitmgng nlitmgng profluitmgng nluitmgng nlitmgng fitmgng litmgng
###   profluitmgng nluitmgng profleuitmgng fitmgng litmgng nlitmgng
###   profluitmgng nluitmgng nleuitmgng fitmgng litmgng nlitmgng
###   profluitmgng nluitmgng

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(1, 1))
##D 
##D x = rnorm(1000)
##D xx = seq(-4, 4, 0.01)
##D y = dnorm(xx)
##D 
##D # MLE for complete parameter set (not recommended!)
##D fit = fitmgng(x)
##D hist(x, breaks = seq(-6, 6, 0.1), freq = FALSE, xlim = c(-4, 4))
##D lines(xx, y)
##D with(fit, lines(xx, ditmgng(xx, nmean, nsd, epsilon, ul, sigmaul, xil,
##D                                                      ur, sigmaur, xir), col="red"))
##D abline(v = fit$ul + fit$epsilon * seq(-1, 1), col = "red")
##D abline(v = fit$ur + fit$epsilon * seq(-1, 1), col = "darkred")
##D   
##D # Profile likelihood for threshold which is then fixed
##D fitfix = fitmgng(x, eseq = seq(0, 2, 0.1), ulseq = seq(-2.5, 0, 0.25), 
##D                                          urseq = seq(0, 2.5, 0.25), fixedeu = TRUE)
##D with(fitfix, lines(xx, ditmgng(xx, nmean, nsd, epsilon, ul, sigmaul, xil,
##D                                                       ur, sigmaur, xir), col="blue"))
##D abline(v = fitfix$ul + fitfix$epsilon * seq(-1, 1), col = "blue")
##D abline(v = fitfix$ur + fitfix$epsilon * seq(-1, 1), col = "darkblue")
##D legend("topright", c("True Density", "GPD-normal-GPD ITM", "Profile likelihood"),
##D   col=c("black", "red", "blue"), lty = 1)
## End(Not run)
  



