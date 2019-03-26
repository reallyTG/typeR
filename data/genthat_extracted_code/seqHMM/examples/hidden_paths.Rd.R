library(seqHMM)


### Name: hidden_paths
### Title: Most Probable Paths of Hidden States
### Aliases: hidden_paths

### ** Examples

# Load a pre-defined HMM
data("hmm_biofam")

# Compute the most probable hidden state paths given the data and the model
mpp <- hidden_paths(hmm_biofam)

# Plot hidden paths for the first 100 individuals
ssplot(mpp, type = "I", tlim = 1:100)

# Because the model structure is so sparse that the posterior probabilities are 
# mostly peaked to single state at each time point, the joint probability of 
# observations and most probable paths of hidden states is almost identical to 
# log-likelihood:

sum(attr(mpp, "log_prob"))
logLik(hmm_biofam)




