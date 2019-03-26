library(tensorBF)


### Name: getDefaultOpts
### Title: A function for generating a default set of parameters for
###   Bayesian Tensor Factorization methods
### Aliases: getDefaultOpts

### ** Examples

#To run the algorithm with other values:
opts <- getDefaultOpts()
opts$ARDW <- FALSE #Switch off Feature-level Sparsity on W's
 ## Not run: res <- tensorBF(Y=Y,opts=opts)



