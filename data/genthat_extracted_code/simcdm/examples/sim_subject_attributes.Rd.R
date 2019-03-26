library(simcdm)


### Name: sim_subject_attributes
### Title: Simulate Subject Latent Attribute Profiles \mathbf{alpha}_c
### Aliases: sim_subject_attributes

### ** Examples

# Define number of subjects and attributes
N = 100
K = 3

# Generate a sample from the Latent Attribute Profile (Alpha) Matrix
# By default, we sample from a uniform distribution weighting of classes.
alphas_builtin = sim_subject_attributes(N, K)

# Generate a sample using custom probabilities from the
# Latent Attribute Profile (Alpha) Matrix
probs = rep(1 / (2 ^ K), 2 ^ K)
alphas_custom = sim_subject_attributes(N, K, probs)



