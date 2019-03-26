library(PhyloMeasures)


### Name: mpd.moments
### Title: Computes the moments of the Mean Pairwise Distance measure
### Aliases: mpd.moments

### ** Examples

#Load phylogenetic tree of bird families from package "ape"
data(bird.families, package = "ape")

# Calculate mean and variance under the uniform model
mpd.moments(bird.families,1:100)

# Create random abundance weights
weights = runif(length(bird.families$tip.label))
names(weights) = bird.families$tip.label

# Calculate mean and variance under the sequential model
mpd.moments(bird.families,1:100,
            null.model="sequential", abundance.weights=weights, reps=1000)



