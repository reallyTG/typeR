library(PhyloMeasures)


### Name: cd.moments
### Title: Computes the moments of the Community Distance measure under the
###   uniform null model
### Aliases: cd.moments

### ** Examples

#Load phylogenetic tree of bird families from package "ape"
data(bird.families, package = "ape")

cd.moments(bird.families,sample.sizes = expand.grid(1:10,1:10))



