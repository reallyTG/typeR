library(phylosignal)


### Name: gridplot.phylo4d
### Title: Gridplot of Traits Values along a Phylogeny
### Aliases: gridplot.phylo4d

### ** Examples

data(navic)
gridplot(navic)

# Multivariate data
require(phylobase)
tipData(navic) <- matrix(rnorm(170), nrow = 17)
gridplot(navic)




