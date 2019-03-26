library(resample)


### Name: samp.bootstrap
### Title: Generate indices for resampling
### Aliases: samp.bootstrap samp.permute
### Keywords: nonparametric htest

### ** Examples

samp.bootstrap(7, 8)
samp.bootstrap(7, 8, size = 6)
samp.bootstrap(7, 8, reduceSize = 1)

# Full permutations
set.seed(0)
samp.permute(7, 8)

# Disjoint samples without replacement = subsets of permutations
set.seed(0)
samp.permute(7, 8, groupSizes = c(2, 5), returnGroup = 1)
set.seed(0)
samp.permute(7, 8, groupSizes = c(2, 5), returnGroup = 2)



