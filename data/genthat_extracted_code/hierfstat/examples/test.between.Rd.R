library(hierfstat)


### Name: test.between
### Title: Tests the significance of the effect of test.lev on genetic
###   differentiation
### Aliases: test.between
### Keywords: nonparametric

### ** Examples

data(gtrunchier)
attach(gtrunchier)
#test whether the locality level has a significant effect on genetic structuring
test.between(gtrunchier[,-c(1,2)],test.lev=Locality,rand.unit=Patch)



