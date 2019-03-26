library(PhyloMeasures)


### Name: cbl.moments
### Title: Computes the moments of the Common Branch Length measure under
###   the uniform null model
### Aliases: cbl.moments

### ** Examples

#Load phylogenetic tree of bird families from package "ape"
data(bird.families, package = "ape")

cbl.moments(bird.families,sample.sizes = expand.grid(1:10,1:10))



