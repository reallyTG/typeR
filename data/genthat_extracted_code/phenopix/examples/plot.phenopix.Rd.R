library(phenopix)


### Name: plot.phenopix
### Title: Plotting 'phenopix' objects.
### Aliases: plot.phenopix

### ** Examples

## Not run: 
##D data(bartlett2009.filtered)
##D fitted <- greenProcess(bartlett2009.filtered, 'klosterman', 
##D   'gu', plot=FALSE, uncert=TRUE, nrep=5, ncores=2)
##D plot(fitted) ## default
##D ## slightly more elaborated, with suppression of default title 
##D plot(fitted, type='p', pch=20, ylab='GCC', xlab='DOY', col='grey', 
##D   what='all', main='Fit + thresholds')
##D ## only with the fitting curve
##D plot(fitted, type='p', pch=20, ylab='GCC', xlab='DOY', col='grey', 
##D   what='fitting', main='Fit only')
##D ## show a boxplot of thresholds extracted from the uncertainty estimation
##D plot(fitted, what='thresholds')
## End(Not run)



