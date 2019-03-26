library(seqHMM)


### Name: mc_to_sc
### Title: Transform a Multichannel Hidden Markov Model into a Single
###   Channel Representation
### Aliases: mc_to_sc

### ** Examples

# Loading a hidden Markov model of the biofam data (hmm object)
data("hmm_biofam")

# Convert the multichannel model to a single-channel model
sc <- mc_to_sc(hmm_biofam)

# Likelihoods of the single-channel and the multichannel model are the same
# (Might not be true if there are missing observations)
logLik(sc)
logLik(hmm_biofam)



