library(evmix)


### Name: fmgamma
### Title: MLE Fitting of Mixture of Gammas Using EM Algorithm
### Aliases: fmgamma lmgamma nlmgamma nlEMmgamma lmgamma fmgamma nlmgamma
###   nlEMmgamma nlmgamma fmgamma lmgamma nlEMmgamma nlEMmgamma fmgamma
###   lmgamma nlmgamma

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(1, 1))
##D 
##D x = c(rgamma(1000, shape = 1, scale = 1), rgamma(3000, shape = 6, scale = 2))
##D xx = seq(-1, 40, 0.01)
##D y = (dgamma(xx, shape = 1, scale = 1) + 3 * dgamma(xx, shape = 6, scale = 2))/4
##D 
##D # Fit by EM algorithm
##D fit = fmgamma(x, M = 2)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-1, 40))
##D lines(xx, y)
##D with(fit, lines(xx, dmgamma(xx, mgshape, mgscale, mgweight), col="red"))
## End(Not run)




