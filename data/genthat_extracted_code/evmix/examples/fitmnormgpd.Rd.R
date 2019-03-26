library(evmix)


### Name: fitmnormgpd
### Title: MLE Fitting of Normal Bulk and GPD Tail Interval Transition
###   Mixture Model
### Aliases: fitmnormgpd litmnormgpd nlitmnormgpd profluitmnormgpd
###   nluitmnormgpd litmnormgpd fitmnormgpd nlitmnormgpd profluitmnormgpd
###   nluitmnormgpd nlitmnormgpd fitmnormgpd litmnormgpd profluitmnormgpd
###   nluitmnormgpd profleuitmnormgpd fitmnormgpd litmnormgpd nlitmnormgpd
###   profluitmnormgpd nluitmnormgpd nleuitmnormgpd fitmnormgpd litmnormgpd
###   nlitmnormgpd profluitmnormgpd nluitmnormgpd

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(1, 1))
##D 
##D x = rnorm(1000)
##D xx = seq(-4, 4, 0.01)
##D y = dnorm(xx)
##D 
##D # MLE for complete parameter set
##D fit = fitmnormgpd(x)
##D hist(x, breaks = seq(-6, 6, 0.1), freq = FALSE, xlim = c(-4, 4))
##D lines(xx, y)
##D with(fit, lines(xx, ditmnormgpd(xx, nmean, nsd, epsilon, u, sigmau, xi), col="red"))
##D abline(v = fit$u + fit$epsilon * seq(-1, 1), col = "red")
##D   
##D # Profile likelihood for threshold which is then fixed
##D fitfix = fitmnormgpd(x, eseq = seq(0, 2, 0.1), useq = seq(0, 2.5, 0.1), fixedeu = TRUE)
##D with(fitfix, lines(xx, ditmnormgpd(xx, nmean, nsd, epsilon, u, sigmau, xi), col="blue"))
##D abline(v = fitfix$u + fitfix$epsilon * seq(-1, 1), col = "blue")
##D legend("topright", c("True Density", "normal-GPD ITM", "Profile likelihood"),
##D   col=c("black", "red", "blue"), lty = 1)
## End(Not run)
  



