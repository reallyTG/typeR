library(seqHMM)


### Name: posterior_probs
### Title: Posterior Probabilities for (Mixture) Hidden Markov Models
### Aliases: posterior_probs

### ** Examples

# Load a pre-defined MHMM
data("mhmm_biofam")

# Compute posterior probabilities
pb <- posterior_probs(mhmm_biofam)

# Locally most probable states for the first subject:
pb[, , 1]



