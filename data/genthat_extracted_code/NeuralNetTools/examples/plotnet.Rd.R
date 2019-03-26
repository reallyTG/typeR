library(NeuralNetTools)


### Name: plotnet
### Title: Plot a neural network model
### Aliases: plotnet plotnet.default plotnet.nnet plotnet.numeric
###   plotnet.mlp plotnet.nn plotnet.train

### ** Examples

## using numeric input

# B1-H1, I1-H1, I2-H1, B1-H2, I1-H2, I2-H2, B2-O1, H1-O1, H2-O1.
wts_in <- c(13.12, 1.49, 0.16, -0.11, -0.19, -0.16, 0.56, -0.52, 0.81)
struct <- c(2, 2, 1) #two inputs, two hidden, one output 

plotnet(wts_in, struct = struct)

# numeric input, two hidden layers

# B1-H11, I1-H11, I2-H11, B1-H12, I1-H12, I2-H12, B2-H21, H11-H21, H12-H21, 
# B2-H22, H11-H22, H12-H22, B3-O1, H21-O1, H22-O1 
wts_in <- c(1.12, 1.49, 0.16, -0.11, -0.19, -0.16, 0.5, 0.2, -0.12, -0.1, 
 0.89, 0.9, 0.56, -0.52, 0.81)
struct <- c(2, 2, 2, 1) # two inputs, two (two nodes each), one output 

plotnet(wts_in, struct = struct)

## using nnet

library(nnet)

data(neuraldat) 
set.seed(123)

mod <- nnet(Y1 ~ X1 + X2 + X3, data = neuraldat, size = 5)
 
plotnet(mod)  

## plot the skip layer from nnet model

mod <- nnet(Y1 ~ X1 + X2 + X3, data = neuraldat, size = 5, skip = TRUE)

plotnet(mod, skip = TRUE)  

## Not run: 
##D ## using RSNNS, no bias layers
##D 
##D library(RSNNS)
##D 
##D x <- neuraldat[, c('X1', 'X2', 'X3')]
##D y <- neuraldat[, 'Y1']
##D mod <- mlp(x, y, size = 5)
##D 
##D plotnet(mod)
##D 
##D # pruned model using code from RSSNS pruning demo
##D pruneFuncParams <- list(max_pr_error_increase = 10.0, pr_accepted_error = 1.0, 
##D  no_of_pr_retrain_cycles = 1000, min_error_to_stop = 0.01, init_matrix_value = 1e-6, 
##D  input_pruning = TRUE, hidden_pruning = TRUE)
##D mod <- mlp(x, y, size = 5, pruneFunc = "OptimalBrainSurgeon", 
##D  pruneFuncParams = pruneFuncParams)
##D 
##D plotnet(mod)
##D plotnet(mod, prune_col = 'lightblue')
##D 
##D ## using neuralnet
##D 
##D library(neuralnet)
##D 
##D mod <- neuralnet(Y1 ~ X1 + X2 + X3, data = neuraldat, hidden = 5)
##D 
##D plotnet(mod)
##D 
##D ## using caret
##D 
##D library(caret)
##D 
##D mod <- train(Y1 ~ X1 + X2 + X3, method = 'nnet', data = neuraldat, linout = TRUE)
##D 
##D plotnet(mod)
##D 
##D ## a more complicated network with categorical response
##D AND <- c(rep(0, 7), 1)
##D OR <- c(0, rep(1, 7))
##D  
##D binary_data <- data.frame(expand.grid(c(0, 1), c(0, 1), c(0, 1)), AND, OR)
##D  
##D mod <- neuralnet(AND + OR ~ Var1 + Var2 + Var3, binary_data, 
##D  hidden = c(6, 12, 8), rep = 10, err.fct = 'ce', linear.output = FALSE)
##D  
##D plotnet(mod)
##D 
##D ## recreate the previous example with numeric inputs
##D 
##D # get the weights and structure in the right format
##D wts <- neuralweights(mod)
##D struct <- wts$struct
##D wts <- unlist(wts$wts)
##D 
##D # plot
##D plotnet(wts, struct = struct)
##D 
##D ## color input nodes by relative importance
##D mod <- nnet(Y1 ~ X1 + X2 + X3, data = neuraldat, size = 5)
##D  
##D rel_imp <- garson(mod, bar_plot = FALSE)$rel_imp
##D cols <- colorRampPalette(c('lightgreen', 'darkgreen'))(3)[rank(rel_imp)]
##D  
##D plotnet(mod, circle_col = list(cols, 'lightblue'))
## End(Not run)



