library(ML.MSBD)


### Name: likelihood_MSBD
### Title: Likelihood calculation for randomly sampled trees
### Aliases: likelihood_MSBD

### ** Examples

# Simulate a random phylogeny
set.seed(25)
tree <- ape::rtree(10)

# Calculate the log likelihood under a constant birth-death model (i.e, no shifts) 
# with full extant & extinct sampling
likelihood_MSBD(tree, shifts = c(), gamma = 0, lambdas = 10, mus = 1, sigma = 1)
# Calculate the log likelihood under a multi-states model with 2 states 
# and full extant & extinct sampling
likelihood_MSBD(tree, shifts = matrix(c(2,1.8,2), nrow = 1), 
                gamma = 0.05, lambdas = c(10, 6), mus = c(1, 0.5), sigma = 1)
# Calculate the log likelihood under a multi-states model with 2 states and exponential decay 
# with full extant & extinct sampling
likelihood_MSBD(tree, shifts = matrix(c(2,1.8,2), nrow = 1), 
                gamma = 0.05, lambdas = c(10, 6), mus = c(1, 0.5), 
                sigma = 1, stepsize = 0.01, lambda_rates = c(0.1, 0.1))




