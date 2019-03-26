library(psd)


### Name: psdcore
### Title: Multitaper power spectral density estimates of a series
### Aliases: psdcore psdcore.default psdcore.ts

### ** Examples

## Not run: 
##D #REX
##D library(psd)
##D 
##D ##
##D ## Multitaper PSD estimation
##D ##
##D 
##D set.seed(1234)
##D X <- rnorm(1e3)
##D 
##D # use the defaults, and appeal to plot.spec
##D # sampling assumed to be 1
##D plot(psdcore(X))
##D 
##D # use more tapers, compare to stats::spectrum, and clear 
##D # env data from the previous calculation
##D psdcore(X, ntaper=10, plot=TRUE, refresh=TRUE)
##D 
##D # change the sampling frequency to 20
##D psdcore(X, X.frq=20, ntaper=10, plot=TRUE, refresh=TRUE)
##D 
## End(Not run)#REX



