library(seqHMM)


### Name: forward_backward
### Title: Forward and Backward Probabilities for Hidden Markov Model
### Aliases: forward_backward

### ** Examples

# Load a pre-defined MHMM
data("mhmm_biofam")

# Compute forward and backward probabilities
fb <- forward_backward(mhmm_biofam)

# The most probable hidden state at time t 
# given the observations up to time t for the first subject:
apply(fb$forward_probs[, , 1], 2, which.max)




