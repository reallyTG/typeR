library(evmix)


### Name: fkdengpd
### Title: MLE Fitting of Kernel Density Estimate for Bulk and GPD Tail
###   Extreme Value Mixture Model
### Aliases: fkdengpd lkdengpd nlkdengpd proflukdengpd nlukdengpd lkdengpd
###   fkdengpd nlkdengpd proflukdengpd nlukdengpd nlkdengpd fkdengpd
###   lkdengpd proflukdengpd nlukdengpd proflukdengpd fkdengpd lkdengpd
###   nlkdengpd nlukdengpd nlukdengpd fkdengpd lkdengpd nlkdengpd
###   proflukdengpd

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
##D fit = fkdengpd(x)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dkdengpd(xx, x, lambda, u, sigmau, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D   
##D # Parameterised tail fraction
##D fit2 = fkdengpd(x, phiu = FALSE)
##D with(fit2, lines(xx, dkdengpd(xx, x, lambda, u, sigmau, xi, phiu), col="blue"))
##D abline(v = fit2$u, col = "blue")
##D legend("topright", c("True Density","Bulk Tail Fraction","Parameterised Tail Fraction"),
##D   col=c("black", "red", "blue"), lty = 1)
##D   
##D # Profile likelihood for initial value of threshold and fixed threshold approach
##D fitu = fkdengpd(x, useq = seq(0, 2, length = 20))
##D fitfix = fkdengpd(x, useq = seq(0, 2, length = 20), fixedu = TRUE)
##D 
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dkdengpd(xx, x, lambda, u, sigmau, xi), col="red"))
##D abline(v = fit$u, col = "red")
##D with(fitu, lines(xx, dkdengpd(xx, x, lambda, u, sigmau, xi), col="purple"))
##D abline(v = fitu$u, col = "purple")
##D with(fitfix, lines(xx, dkdengpd(xx, x, lambda, u, sigmau, xi), col="darkgreen"))
##D abline(v = fitfix$u, col = "darkgreen")
##D legend("topright", c("True Density","Default initial value (90% quantile)",
##D  "Prof. lik. for initial value", "Prof. lik. for fixed threshold"),
##D  col=c("black", "red", "purple", "darkgreen"), lty = 1)
## End(Not run)
  



