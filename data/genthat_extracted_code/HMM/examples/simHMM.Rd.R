library(HMM)


### Name: simHMM
### Title: Simulate states and observations for a Hidden Markov Model
### Aliases: simHMM
### Keywords: models

### ** Examples

# Initialise HMM
hmm = initHMM(c("X","Y"),c("a","b","c"))
# Simulate from the HMM
simHMM(hmm, 100)



