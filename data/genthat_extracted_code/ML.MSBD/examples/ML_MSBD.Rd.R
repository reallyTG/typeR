library(ML.MSBD)


### Name: ML_MSBD
### Title: Full Maximum Likelihood inference of birth and death rates
###   together with their changes along a phylogeny under a multi-type
###   birth-death model.
### Aliases: ML_MSBD

### ** Examples

# Simulate a random phylogeny
set.seed(25)
tree <- ape::rtree(10)

# Infer the most likely multi-states birth-death model 
# with full extant & extinct sampling
## Not run: ML_MSBD(tree, initial_values = c(0.1, 10, 1), sigma = 1, time_mode = "mid") 
# Infer the most likely multi-states birth-death model with exponential decay
# and full extant & extinct sampling
## Not run: 
##D ML_MSBD(tree, initial_values = c(0.1, 10, 0.5, 1), sigma = 1, 
##D                  stepsize = 0.1, time_mode = "mid")
## End(Not run)

# Simulate a random phylogeny with extant samples
set.seed(24)
tree2 <- ape::rcoal(10)

# Infer the most likely multi-states Yule model with partial extant sampling
## Not run: 
##D ML_MSBD(tree2, initial_values = c(0.1, 10), no_extinction = TRUE, 
##D                   rho = 0.5, time_mode = "mid")
## End(Not run)
# Infer the most likely multi-states birth-death model with full extant sampling 
# and unresolved extant tips
## Not run: 
##D ML_MSBD(tree2, initial_values = c(0.1, 10, 1), 
##D                   lineage_counts = c(2,5,1,3,1,1,1,1,2,6), tcut = 0.05, time_mode = "mid")
## End(Not run)




