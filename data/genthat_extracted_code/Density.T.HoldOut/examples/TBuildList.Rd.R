library(Density.T.HoldOut)


### Name: TBuildList
### Title: Construction of a list of regular and irregular histograms,
###   kernel and parametric estimators.
### Aliases: TBuildList

### ** Examples

## Not run: 
##D ## list of estimators containing the regular histograms with number of bins varying 
##D ## between 1 and 150, kernel estimators using triangular kernel and parametric estimators 
##D ## build from a normal sample of size 1000:
##D TBuildList(X=rnorm(1000),family = c("Kernel", "RegularHisto","Parametric"), 
##D 	kerneltab = 'triangular',Dmax=150)
##D 
##D ## list of estimators containing irregular histograms and kernel estimators 
##D ## with bandwidths 2^-j, j=1:,...,ceiling(log(length(X))), build from an exponential 
##D ## sample X of size 500:
##D TBuildList(X=rexp(500),family = c("IrregularHisto","Kernel"),
##D 	bwtab=2^-c(1:ceiling(log(length(X)))))
## End(Not run)



