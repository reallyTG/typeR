library(NeuralNetTools)


### Name: garson
### Title: Variable importance using Garson's algorithm
### Aliases: garson garson.default garson.numeric garson.nnet garson.mlp
###   garson.nn garson.train

### ** Examples


## using numeric input

wts_in <- c(13.12, 1.49, 0.16, -0.11, -0.19, -0.16, 0.56, -0.52, 0.81)
struct <- c(2, 2, 1) #two inputs, two hidden, one output 

garson(wts_in, struct)

## using nnet

library(nnet)

data(neuraldat) 
set.seed(123)

mod <- nnet(Y1 ~ X1 + X2 + X3, data = neuraldat, size = 5)
 
garson(mod)  

## Not run: 
##D ## using RSNNS, no bias layers
##D 
##D library(RSNNS)
##D 
##D x <- neuraldat[, c('X1', 'X2', 'X3')]
##D y <- neuraldat[, 'Y1']
##D mod <- mlp(x, y, size = 5)
##D 
##D garson(mod)
##D 
##D ## using neuralnet
##D 
##D library(neuralnet)
##D 
##D mod <- neuralnet(Y1 ~ X1 + X2 + X3, data = neuraldat, hidden = 5)
##D 
##D garson(mod)
##D 
##D ## using caret
##D 
##D library(caret)
##D 
##D mod <- train(Y1 ~ X1 + X2 + X3, method = 'nnet', data = neuraldat, linout = TRUE)
##D 
##D garson(mod)
##D 
##D ## modify the plot using ggplot2 syntax
##D library(ggplot2)
##D 
##D mod <- nnet(Y1 ~ X1 + X2 + X3, data = neuraldat, size = 5)
##D 
##D cols <- heat.colors(10)
##D garson(mod) +
##D   scale_y_continuous('Rel. Importance', limits = c(-1, 1)) + 
##D   scale_fill_gradientn(colours = cols) + 
##D   scale_colour_gradientn(colours = cols)
## End(Not run)



