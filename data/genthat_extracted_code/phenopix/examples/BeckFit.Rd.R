library(phenopix)


### Name: BeckFit
### Title: A function to fit a double logisitic function to a vector
###   according to Beck et al. (2006)
### Aliases: BeckFit

### ** Examples

## Not run: 
##D library(zoo)
##D data(bartlett2009.filtered)
##D ## fit without uncertainty estimation
##D fitted.beck <- BeckFit(bartlett2009.filtered)
##D days <- as.numeric(format(index(bartlett2009.filtered), '##D 
##D plot(days, bartlett2009.filtered)
##D lines(fitted.beck$fit$predicted, col='red')
##D ## look at fitting parameters
##D fitted.beck$fit$params
##D ## look at fitting equation, where t is time
##D fitted.beck$fit$formula
## End(Not run)



