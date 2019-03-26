library(BoolNet)


### Name: markovSimulation
### Title: Identify important states in probabilistic Boolean networks
### Aliases: markovSimulation
### Keywords: probabilistic Boolean network PBN Markov chain

### ** Examples

# load example network
data(examplePBN)

# perform a Markov chain simulation
sim <- markovSimulation(examplePBN)

# print the relevant states and transition probabilities
print(sim)

# plot the transitions and their probabilities
plotPBNTransitions(sim)



