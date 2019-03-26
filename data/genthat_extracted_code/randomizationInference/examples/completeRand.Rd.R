library(randomizationInference)


### Name: completeRand
### Title: Random Treatment Assignments for Completely Randomized Designs
### Aliases: completeRand
### Keywords: methods

### ** Examples

w1 = c(0,0,0,0,1,1,1,1)
completeRand(w1, nrand = 5)

w2 = c(0,1,0,1,0,1,0,1)
completeRand(w = cbind(w1,w2), nrand = 5)


