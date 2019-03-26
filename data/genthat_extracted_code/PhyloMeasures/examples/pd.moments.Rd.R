library(PhyloMeasures)


### Name: pd.moments
### Title: Computes the moments of the Phylogenetic Diversity measure
### Aliases: pd.moments

### ** Examples

#Load phylogenetic tree of bird families from package "ape"
data(bird.families, package = "ape")

# Calculate mean and variance under the uniform model
pd.moments(bird.families,1:100)

# Create random abundance weights
weights = runif(length(bird.families$tip.label))
names(weights) = bird.families$tip.label

# Calculate mean and variance under the sequential model
pd.moments(bird.families,1:100,
           null.model="sequential", abundance.weights=weights, reps=1000)



