library(seqHMM)


### Name: trim_model
### Title: Trim Small Probabilities of Hidden Markov Model
### Aliases: trim_model

### ** Examples

data("hmm_biofam")

# Testing if changing parameter values smaller than 1e-03 to zero
# leads to improved log-likelihood.
hmm_trim <- trim_model(hmm_biofam, zerotol = 1e-03, maxit = 10)



