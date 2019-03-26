library(spgs)


### Name: simulateMarkovChain
### Title: Simulate a first-Order Markov Chain
### Aliases: simulateMarkovChain
### Keywords: models ts distribution datagen

### ** Examples

simulateMarkovChain(50, matrix(c(.8, .2, .2, .8), ncol=2))
simulateMarkovChain(50, rstochmat(3), states=c("yes", "no", "maybe"))



