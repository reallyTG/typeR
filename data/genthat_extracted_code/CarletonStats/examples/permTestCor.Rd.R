library(CarletonStats)


### Name: permTestCor
### Title: Permutation test for the correlation of two variables.
### Aliases: permTestCor permTestCor.default permTestCor.formula
### Keywords: correlation permutation randomization resampling test

### ** Examples


plot(states03$HSGrad, states03$TeenBirths)
cor(states03$HSGrad, states03$TeenBirths)

permTestCor(states03$HSGrad, states03$TeenBirths)
permTestCor(TeenBirths ~ HSGrad, data = states03)




