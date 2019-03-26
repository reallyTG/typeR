library(hierfstat)


### Name: test.between.within
### Title: Tests the significance of the effect of test.lev on genetic
###   differentiation
### Aliases: test.between.within
### Keywords: nonparametric

### ** Examples

data(yangex)
attach(yangex)
#tests for the effect of spop on genetic structure
test.between.within(data.frame(genot),within=pop,test=spop,rand=sspop)



