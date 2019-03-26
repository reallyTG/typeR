library(HDclust)


### Name: vbSearchControl
### Title: Parameters for variable block structure search.
### Aliases: vbSearchControl

### ** Examples

# setting up permutations
perm <- list(c(1,2,3), c(1,3,2), c(3,2,1))
searchControl <- vbSearchControl(perm=perm, dim=3)

# setting up a map between block dimensionality and number of states
searchControl <- vbSearchControl(maxDim=5, numstPerDim=c(3,4,5,6,7))



