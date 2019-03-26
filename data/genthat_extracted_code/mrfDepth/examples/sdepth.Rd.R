library(mrfDepth)


### Name: sdepth
### Title: Simplicial depth of points relative to a dataset
### Aliases: sdepth
### Keywords: multivariate

### ** Examples

data(bloodfat)
Result <- sdepth(x = bloodfat)
mrainbowplot(bloodfat, depth = Result$depthZ)



