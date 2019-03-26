library(randomizationInference)


### Name: blockRand
### Title: Random Treatment Assignments for Randomized Block Designs
### Aliases: blockRand
### Keywords: methods

### ** Examples

w1 = c(0,1,0,1,0,1,0,1)
block = c(0,0,0,0,1,1,1,1)
blockRand(w1, nrand = 5, block)

w2 = c(0,0,1,1,0,0,1,1)
blockRand(w = cbind(w1,w2), nrand = 5, block)



