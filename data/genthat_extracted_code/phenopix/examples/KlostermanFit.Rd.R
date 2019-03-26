library(phenopix)


### Name: KlostermanFit
### Title: A function to fit a double logisitic function to a vector
###   according to Klosterman et al. (2014)
### Aliases: KlostermanFit

### ** Examples

## Not run: 
##D library(zoo)
##D data(bartlett2009.filtered)
##D ## fit without uncertainty estimation
##D fitted.kl1 <- KlostermanFit(bartlett2009.filtered, which='light')
##D fitted.kl2 <- KlostermanFit(bartlett2009.filtered, which='heavy')
##D ## check fitting
##D plot(bartlett2009.filtered)
##D lines(fitted.kl1$fit$predicted, col='red')
##D lines(fitted.kl2$fit$predicted, col='blue')
##D legend('topleft',col=c('red', 'blue'), lty=1, 
##D   legend=c('light', 'heavy'), bty='n')
## End(Not run)



