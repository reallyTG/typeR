library(BoolNet)


### Name: getTransitionProbabilities
### Title: Get a matrix of transitions and their probabilities in
###   probabilistic Boolean networks
### Aliases: getTransitionProbabilities
### Keywords: Boolean network probabilistic Boolean network PBN transition
###   probability

### ** Examples

# load example network
data(examplePBN)

# perform a Markov chain simulation
sim <- markovSimulation(examplePBN)

# print out the probability table
print(getTransitionProbabilities(sim))



