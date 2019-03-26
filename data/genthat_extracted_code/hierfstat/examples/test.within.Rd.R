library(hierfstat)


### Name: test.within
### Title: Tests the significance of the effect of inner.level on genetic
###   differentiation within blocks defined by outer.level
### Aliases: test.within
### Keywords: nonparametric

### ** Examples

data(gtrunchier)
attach(gtrunchier)
#tests whether the patch level has a significant effect on genetic structure
test.within(gtrunchier[,-c(1,2)],within=Locality,test.lev=Patch)



