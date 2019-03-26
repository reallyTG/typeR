library(evmix)


### Name: fdwm
### Title: MLE Fitting of Dynamically Weighted Mixture Model
### Aliases: fdwm ldwm nldwm ldwm fdwm nldwm nldwm fdwm ldwm

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(1, 1))
##D 
##D x = rweibull(1000, shape = 2)
##D xx = seq(-0.1, 4, 0.01)
##D y = dweibull(xx, shape = 2)
##D 
##D fit = fdwm(x, std.err = FALSE)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-0.1, 4))
##D lines(xx, y)
##D with(fit, lines(xx, ddwm(xx, wshape, wscale, cmu, ctau, sigmau, xi), col="red"))
## End(Not run)




