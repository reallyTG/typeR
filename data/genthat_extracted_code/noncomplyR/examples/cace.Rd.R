library(noncomplyR)


### Name: cace
### Title: Compute the Posterior Distribution of the CACE
### Aliases: cace

### ** Examples

# CACE based on a subset of the vitaminA dataset
set.seed(4923)
chain <- compliance_chain(vitaminA[sample(1:nrow(vitaminA), 1000),], outcome_model = "binary",
 exclusion_restriction = TRUE, strong_access = TRUE, n_iter = 10, n_burn = 1)

cace(chain, outcome_model = "binary", strong_access = TRUE)

# matrix representing the samples from the posterior distribution of the model parameters
posterior_mat <- matrix(rnorm(10*8, mean = 10), nrow = 10, ncol = 8)
cace(posterior_mat, "normal", strong_access = TRUE)




