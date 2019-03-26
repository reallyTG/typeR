library(NeuralNetTools)


### Name: neuralweights
### Title: Get weights for a neural network
### Aliases: neuralweights neuralweights.numeric neuralweights.nnet
###   neuralweights.mlp neuralweights.nn

### ** Examples


data(neuraldat)
set.seed(123)

## using numeric input

wts_in <- c(13.12, 1.49, 0.16, -0.11, -0.19, -0.16, 0.56, -0.52, 0.81)
struct <- c(2, 2, 1) #two inputs, two hidden, one output 

neuralweights(wts_in, struct = struct)

## using nnet

library(nnet)

mod <- nnet(Y1 ~ X1 + X2 + X3, data = neuraldat, size = 5, linout = TRUE)
 
neuralweights(mod)  

## Not run: 
##D ## using RSNNS, no bias layers
##D 
##D library(RSNNS)
##D 
##D x <- neuraldat[, c('X1', 'X2', 'X3')]
##D y <- neuraldat[, 'Y1']
##D mod <- mlp(x, y, size = 5, linOut = TRUE)
##D 
##D neuralweights(mod)
##D 
##D # pruned model using code from RSSNS pruning demo
##D pruneFuncParams <- list(max_pr_error_increase = 10.0, pr_accepted_error = 1.0, 
##D  no_of_pr_retrain_cycles = 1000, min_error_to_stop = 0.01, init_matrix_value = 1e-6, 
##D  input_pruning = TRUE, hidden_pruning = TRUE)
##D mod <- mlp(x, y, size = 5, pruneFunc = "OptimalBrainSurgeon", 
##D  pruneFuncParams = pruneFuncParams)
##D 
##D neuralweights(mod)
##D 
##D ## using neuralnet
##D 
##D library(neuralnet)
##D 
##D mod <- neuralnet(Y1 ~ X1 + X2 + X3, data = neuraldat, hidden = 5)
##D 
##D neuralweights(mod)
## End(Not run)



