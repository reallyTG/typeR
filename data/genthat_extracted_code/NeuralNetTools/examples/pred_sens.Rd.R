library(NeuralNetTools)


### Name: pred_sens
### Title: Predicted values for Lek profile method
### Aliases: pred_sens

### ** Examples


## using nnet

library(nnet)

data(neuraldat) 
set.seed(123)

mod <- nnet(Y1 ~ X1 + X2 + X3, data = neuraldat, size = 5)

mat_in <- neuraldat[, c('X1', 'X2', 'X3')]
grps <- apply(mat_in, 2, quantile, seq(0, 1, by = 0.2))

pred_sens(mat_in, mod, 'X1', 100, grps, 'Y1')



