library(sigr)


### Name: estimateDifferenceZeroCrossing
### Title: Studentized estimate of how often a difference is below zero.
### Aliases: estimateDifferenceZeroCrossing

### ** Examples


set.seed(2352)
resampledDiffs <- rnorm(10)+1
estimateDifferenceZeroCrossing(resampledDiffs)




