library(PhyloMeasures)


### Name: cac.moments
### Title: Computes the statistical moments of the Core Ancestor Cost
###   measure
### Aliases: cac.moments

### ** Examples

#Load phylogenetic tree of bird families from package "ape"
data(bird.families, package = "ape")

# Calculate first four raw moments under the uniform model
cac.moments(bird.families,0.75,1:100,k=4)

# Create random abundance weights
weights = runif(length(bird.families$tip.label))
names(weights) = bird.families$tip.label

# Calculate mean and variance under the sequential model
cac.moments(bird.families,0.75,1:100,k=2,
            null.model="sequential", abundance.weights=weights, reps=1000)



