library(spnn)


### Name: spnn-package
### Title: Scale Invariant Probabilistic Neural Networks
### Aliases: spnn-package spnn
### Keywords: spnn neural network probability pnn

### ** Examples

library(spnn)
data(norms)

pnn <- pnn.learn(norms)
pnn.guess(pnn, c(1,1))
pnn.guess(pnn, c(2,1))
pnn.guess(pnn, c(1.5,1))



