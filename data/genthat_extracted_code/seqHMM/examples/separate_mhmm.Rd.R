library(seqHMM)


### Name: separate_mhmm
### Title: Reorganize a mixture hidden Markov model to a list of separate
###   hidden Markov models (covariates ignored)
### Aliases: separate_mhmm

### ** Examples

# Loading mixture hidden Markov model (mhmm object)
# of the biofam data
data("mhmm_biofam")

# Separate models for clusters
sep_hmm <- separate_mhmm(mhmm_biofam)

# Plotting the model for the first cluster
plot(sep_hmm[[1]])



