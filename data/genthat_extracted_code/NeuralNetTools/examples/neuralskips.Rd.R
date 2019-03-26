library(NeuralNetTools)


### Name: neuralskips
### Title: Get weights for the skip layer in a neural network
### Aliases: neuralskips neuralskips.nnet

### ** Examples


data(neuraldat)
set.seed(123)

## using nnet

library(nnet)

mod <- nnet(Y1 ~ X1 + X2 + X3, data = neuraldat, size = 5, linout = TRUE, 
 skip = TRUE)
 
neuralskips(mod)  




