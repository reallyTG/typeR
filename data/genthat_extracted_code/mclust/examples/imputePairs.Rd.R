library(mclust)


### Name: imputePairs
### Title: Pairwise Scatter Plots showing Missing Data Imputations
### Aliases: imputePairs
### Keywords: cluster

### ** Examples

## Not run: 
##D # Note that package 'mix' must be installed
##D data(stlouis, package = "mix")
##D  
##D # impute the continuos variables in the stlouis data
##D stlimp <- imputeData(stlouis[,-(1:3)])
##D 
##D # plot imputed values
##D imputePairs(stlouis[,-(1:3)], stlimp)
## End(Not run)



