library(simba)


### Name: dist.tmp
### Title: Calculate the distance between the instances or variables of two
###   similar data-sets.
### Aliases: dist.tmp
### Keywords: methods multivariate

### ** Examples

data(abis)

##just to see that the function takes care of matching instances 
##and variables we compare abis.spec with a permuted version of
##itself and skip some instances and variables in the original matrix.
dist.tmp(abis.spec[5:50,3:120], apply(abis.spec, 2, sample), method="bray")




