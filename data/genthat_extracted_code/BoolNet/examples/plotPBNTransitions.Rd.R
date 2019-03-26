library(BoolNet)


### Name: plotPBNTransitions
### Title: Visualize the transitions in a probabilistic Boolean network
### Aliases: plotPBNTransitions
### Keywords: probabilistic Boolean network PBN Boolean network plot
###   transition graph

### ** Examples

# load example network
data(examplePBN)

# perform a Markov chain simulation
sim <- markovSimulation(examplePBN)

# plot the transitions and their probabilities
plotPBNTransitions(sim)



