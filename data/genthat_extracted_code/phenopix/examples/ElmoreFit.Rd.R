library(phenopix)


### Name: ElmoreFit
### Title: A function to fit a double logisitic function to a vector
###   according to Elmore et al. (2012)
### Aliases: ElmoreFit

### ** Examples


## Not run: 
##D library(zoo)
##D data(bartlett2009.filtered)
##D ## fit without uncertainty estimation
##D fitted.elmore <- ElmoreFit(bartlett2009.filtered)
##D days <- as.numeric(format(index(bartlett2009.filtered), '##D 
##D plot(days, bartlett2009.filtered)
##D lines(fitted.elmore$fit$predicted, col='red')
##D ## look at fitting parameters
##D fitted.elmore$fit$params
##D ## look at fitting equation, where t is time
##D fitted.elmore$fit$formula
## End(Not run)



