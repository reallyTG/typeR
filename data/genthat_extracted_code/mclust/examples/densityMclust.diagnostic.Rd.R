library(mclust)


### Name: densityMclust.diagnostic
### Title: Diagnostic plots for 'mclustDensity' estimation
### Aliases: densityMclust.diagnostic
### Keywords: cluster dplot

### ** Examples

## Not run: 
##D x <- faithful$waiting
##D dens <- densityMclust(x)
##D plot(dens, x, what = "diagnostic")
##D # or
##D densityMclust.diagnostic(dens, type = "cdf")
##D densityMclust.diagnostic(dens, type = "qq")
## End(Not run)



