library(phenopix)


### Name: GuFit
### Title: A function to fit a double logisitic function to a vector
###   according to Gu et al. (2003)
### Aliases: GuFit

### ** Examples

## Not run: 
##D library(zoo)
##D data(bartlett2009.filtered)
##D ## fit without uncertainty estimation
##D fitted.gu <- GuFit(bartlett2009.filtered)
##D ## convert 
##D plot(bartlett2009.filtered)
##D lines(fitted.gu$fit$predicted, col='red')
##D ## look at fitting parameters
##D fitted.gu$fit$params
##D ## look at fitting equation, where t is time
##D fitted.gu$fit$formula
## End(Not run)



