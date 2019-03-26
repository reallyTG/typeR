library(fishtree)


### Name: fishtree_phylogeny
### Title: Get a phylogeny from the Fish Tree of Life
### Aliases: fishtree_phylogeny

### ** Examples

surgeons <- fishtree_phylogeny(rank = "Acanthuridae")

# Chronograms may not be ultrametric due to numerical precision issues
ape::is.ultrametric(surgeons)
ape::is.ultrametric(surgeons, tol = 0.00001)



