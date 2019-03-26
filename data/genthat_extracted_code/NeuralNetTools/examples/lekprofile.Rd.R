library(NeuralNetTools)


### Name: lekprofile
### Title: Sensitivity analysis using Lek's profile method
### Aliases: lekprofile lekprofile.default lekprofile.nnet lekprofile.mlp
###   lekprofile.train lekprofile.nn

### ** Examples


## using nnet

library(nnet)

set.seed(123)

mod <- nnet(Y1 ~ X1 + X2 + X3, data = neuraldat, size = 5)
 
lekprofile(mod)  

## Not run: 
##D ## using RSNNS, no bias layers
##D 
##D library(RSNNS)
##D 
##D x <- neuraldat[, c('X1', 'X2', 'X3')]
##D y <- neuraldat[, 'Y1', drop = FALSE]
##D 
##D mod <- mlp(x, y, size = 5)
##D 
##D lekprofile(mod, xvars = x)
##D 
##D ## using neuralnet
##D 
##D library(neuralnet)
##D 
##D mod <- neuralnet(Y1 ~ X1 + X2 + X3, data = neuraldat, hidden = 5)
##D 
##D lekprofile(mod)
##D 
##D ## back to nnet, not using formula to create model
##D ## y variable must have a name attribute
##D 
##D mod <- nnet(x, y, size = 5)
##D 
##D lekprofile(mod)
##D 
##D ## using caret
##D 
##D library(caret)
##D 
##D mod <- train(Y1 ~ X1 + X2 + X3, method = 'nnet', data = neuraldat, linout = TRUE)
##D 
##D lekprofile(mod)
##D 
##D ## group by clusters instead of sequencing by quantiles
##D 
##D mod <- nnet(Y1 ~ X1 + X2 + X3, data = neuraldat, size = 5)
##D  
##D lekprofile(mod, group_vals = 6) # six clusters
##D 
##D ## enter an arbitrary grouping scheme for the group values
##D ## i.e. hold all values at 0.5
##D group_vals <- rbind(rep(0.5, length = ncol(x)))
##D group_vals <- data.frame(group_vals)
##D names(group_vals) <- names(group_vals)
##D 
##D lekprofile(mod, group_vals = group_vals, xsel = 'X3')
## End(Not run)



