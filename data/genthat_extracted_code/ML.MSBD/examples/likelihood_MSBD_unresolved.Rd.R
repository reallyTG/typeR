library(ML.MSBD)


### Name: likelihood_MSBD_unresolved
### Title: Likelihood calculation for unresolved trees
### Aliases: likelihood_MSBD_unresolved

### ** Examples

# Simulate a random phylogeny
set.seed(24)
tree <- ape::rcoal(10)

# Calculate the log likelihood under a constant birth-death model (i.e, no shifts) 
# with unresolved tips
likelihood_MSBD_unresolved(tree, shifts = c(), gamma = 0, lambdas = 10, mus = 1, 
                           lineage_counts = c(2,5,1,3,1,1,1,1,2,6), tcut = 0.05)
# Calculate the log likelihood under a multi-states model with 2 states and unresolved tips
likelihood_MSBD_unresolved(tree, shifts = matrix(c(2,0.7,2), nrow = 1), 
                           gamma = 0.05, lambdas = c(10, 5), mus = c(1, 1), 
                           lineage_counts = c(2,5,1,3,1,1,1,1,2,6), tcut = 0.05)




