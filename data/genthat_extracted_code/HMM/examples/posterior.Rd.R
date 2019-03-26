library(HMM)


### Name: posterior
### Title: Computes the posterior probabilities for the states
### Aliases: posterior
### Keywords: methods

### ** Examples

# Initialise HMM
hmm = initHMM(c("A","B"), c("L","R"), transProbs=matrix(c(.8,.2,.2,.8),2),
	emissionProbs=matrix(c(.6,.4,.4,.6),2))
print(hmm)
# Sequence of observations
observations = c("L","L","R","R")
# Calculate posterior probablities of the states
posterior = posterior(hmm,observations)
print(posterior)



