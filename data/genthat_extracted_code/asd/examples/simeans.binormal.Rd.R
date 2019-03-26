library(asd)


### Name: simeans.binormal
### Title: Simulate Bivariate Normal Means
### Aliases: simeans.binormal
### Keywords: design

### ** Examples


# need to load mvtnorm
library(mvtnorm)

# generate data
set.seed(1234)
simeans.binormal(n=10,means=c(2,3),vars=c(1,5),corr=0.5)




