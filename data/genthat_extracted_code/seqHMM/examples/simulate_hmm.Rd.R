library(seqHMM)


### Name: simulate_hmm
### Title: Simulate hidden Markov models
### Aliases: simulate_hmm

### ** Examples

# Parameters for the HMM
emission_probs <- matrix(c(0.5, 0.2, 0.5, 0.8), 2, 2)
transition_probs <- matrix(c(5/6, 1/6, 1/6, 5/6), 2, 2)
initial_probs <- c(1, 0)

# Setting the seed for simulation
set.seed(1)

# Simulating sequences
sim <- simulate_hmm(
  n_sequences = 10, initial_probs = initial_probs, 
  transition_probs = transition_probs, 
  emission_probs = emission_probs, 
  sequence_length = 20)
  
ssplot(sim, sortv = "mds.obs", type = "I")



