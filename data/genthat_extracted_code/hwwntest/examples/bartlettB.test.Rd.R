library(hwwntest)


### Name: bartlettB.test
### Title: Bartlett's B test for white noise
### Aliases: bartlettB.test
### Keywords: ts

### ** Examples

#
# Do white noise test on smallish data set
#
x <- rnorm(30)
bartlettB.test(x)
#
# For my realization the answer was:
#
#
#	Bartlett B Test for white noise
#
#data:  
#= 0.3747, p-value = 0.999
#
# So, we accept H_0



