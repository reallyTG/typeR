library(NeuralNetTools)


### Name: olden
### Title: Variable importance using connection weights
### Aliases: olden olden.default olden.numeric olden.nnet olden.mlp
###   olden.nn olden.train

### ** Examples


## using numeric input

wts_in <- c(13.12, 1.49, 0.16, -0.11, -0.19, -0.16, 0.56, -0.52, 0.81)
struct <- c(2, 2, 1) #two inputs, two hidden, one output 

olden(wts_in, struct)

## using nnet

library(nnet)

data(neuraldat) 
set.seed(123)

mod <- nnet(Y1 ~ X1 + X2 + X3, data = neuraldat, size = 5)
 
olden(mod)  

## Not run: 
##D ## View the difference for a model w/ skip layers
##D 
##D set.seed(123)
##D 
##D mod <- nnet(Y1 ~ X1 + X2 + X3, data = neuraldat, size = 5, skip = TRUE)
##D 
##D olden(mod)
##D 
##D ## using RSNNS, no bias layers
##D 
##D library(RSNNS)
##D 
##D x <- neuraldat[, c('X1', 'X2', 'X3')]
##D y <- neuraldat[, 'Y1']
##D mod <- mlp(x, y, size = 5)
##D 
##D olden(mod)
##D 
##D ## using neuralnet
##D 
##D library(neuralnet)
##D 
##D mod <- neuralnet(Y1 ~ X1 + X2 + X3, data = neuraldat, hidden = 5)
##D 
##D olden(mod)
##D 
##D ## using caret
##D 
##D library(caret)
##D 
##D mod <- train(Y1 ~ X1 + X2 + X3, method = 'nnet', data = neuraldat, linout = TRUE)
##D 
##D olden(mod)
##D 
##D ## multiple hidden layers
##D 
##D x <- neuraldat[, c('X1', 'X2', 'X3')]
##D y <- neuraldat[, 'Y1']
##D mod <- mlp(x, y, size = c(5, 7, 6), linOut = TRUE)
##D 
##D olden(mod)
## End(Not run)



