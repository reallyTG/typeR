library(evmix)


### Name: fhpd
### Title: MLE Fitting of Hybrid Pareto Extreme Value Mixture Model
### Aliases: fhpd lhpd nlhpd lhpd fhpd nlhpd nlhpd fhpd lhpd

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(1, 1))
##D 
##D x = rnorm(1000)
##D xx = seq(-4, 4, 0.01)
##D y = dnorm(xx)
##D 
##D # Hybrid Pareto provides reasonable fit for some asymmetric heavy upper tailed distributions
##D # but not for cases such as the normal distribution
##D fit = fhpd(x, std.err = FALSE)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-4, 4))
##D lines(xx, y)
##D with(fit, lines(xx, dhpd(xx, nmean, nsd, xi), col="red"))
##D abline(v = fit$u)
##D 
##D # Notice that if tail fraction is included a better fit is obtained
##D fit2 = fnormgpdcon(x, std.err = FALSE)
##D with(fit2, lines(xx, dnormgpdcon(xx, nmean, nsd, u, xi), col="blue"))
##D abline(v = fit2$u)
##D legend("topright", c("Standard Normal", "Hybrid Pareto", "Normal+GPD Continuous"),
##D   col=c("black", "red", "blue"), lty = 1)
## End(Not run)
 



