library(ML.MSBD)


### Name: ML.MSBD-package
### Title: Maximum Likelihood Inference on Multi-State Trees
### Aliases: ML.MSBD-package ML.MSBD
### Keywords: package

### ** Examples

# Simulate a random phylogeny
set.seed(25)
tree <- ape::rtree(10)

# Calculate the log likelihood under a multi-states model with 2 states 
# and full extant & extinct sampling
likelihood_MSBD(tree, shifts = matrix(c(2,1.8,2), nrow = 1), 
  gamma = 0.05, lambdas = c(10, 6), mus = c(1, 0.5), sigma = 1)

# Infer the most likely multi-states birth-death model with full extant & extinct sampling
## Not run: ML_MSBD(tree, initial_values = c(0.1, 10, 1), sigma = 1, time_mode = "mid") 
# Infer the most likely multi-states birth-death model with exponential decay 
# and full extant & extinct sampling
## Not run: 
##D ML_MSBD(tree, initial_values = c(0.1, 10, 0.5, 1), sigma = 1, 
##D   stepsize = 0.1, time_mode = "mid")
## End(Not run)



