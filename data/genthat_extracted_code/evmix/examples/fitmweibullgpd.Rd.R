library(evmix)


### Name: fitmweibullgpd
### Title: MLE Fitting of Weibull Bulk and GPD Tail Interval Transition
###   Mixture Model
### Aliases: fitmweibullgpd litmweibullgpd nlitmweibullgpd
###   profluitmweibullgpd nluitmweibullgpd litmweibullgpd fitmweibullgpd
###   nlitmweibullgpd profluitmweibullgpd nluitmweibullgpd nlitmweibullgpd
###   fitmweibullgpd litmweibullgpd profluitmweibullgpd nluitmweibullgpd
###   profleuitmweibullgpd fitmweibullgpd litmweibullgpd nlitmweibullgpd
###   profluitmweibullgpd nluitmweibullgpd nleuitmweibullgpd fitmweibullgpd
###   litmweibullgpd nlitmweibullgpd profluitmweibullgpd nluitmweibullgpd

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(1, 1))
##D 
##D x = rweibull(1000, shape = 1, scale = 2)
##D xx = seq(-0.2, 10, 0.01)
##D y = dweibull(xx, shape = 1, scale = 2)
##D 
##D # MLE for complete parameter set
##D fit = fitmweibullgpd(x)
##D hist(x, breaks = seq(0, 20, 0.1), freq = FALSE, xlim = c(-0.2, 10))
##D lines(xx, y)
##D with(fit, lines(xx, ditmweibullgpd(xx, wshape, wscale, epsilon, u, sigmau, xi), col="red"))
##D abline(v = fit$u + fit$epsilon * seq(-1, 1), col = "red")
##D   
##D # Profile likelihood for threshold which is then fixed
##D fitfix = fitmweibullgpd(x, eseq = seq(0, 2, 0.1), useq = seq(0.5, 4, 0.1), fixedeu = TRUE)
##D with(fitfix, lines(xx, ditmweibullgpd(xx, wshape, wscale, epsilon, u, sigmau, xi), col="blue"))
##D abline(v = fitfix$u + fitfix$epsilon * seq(-1, 1), col = "blue")
##D legend("topright", c("True Density", "Weibull-GPD ITM", "Profile likelihood"),
##D   col=c("black", "red", "blue"), lty = 1)
## End(Not run)
  



