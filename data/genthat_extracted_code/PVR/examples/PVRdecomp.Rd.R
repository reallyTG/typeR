library(PVR)


### Name: PVRdecomp
### Title: Phylogenetic distances matrix (eigen)decomposition.
### Aliases: PVRdecomp
### Keywords: phylogenetic signal phylogeny

### ** Examples

library(ape)
tree <- rcoal(10)
#Decomposing phylogenetic distance matrix derived from tree into a set of orthogonal vectors
x <- PVRdecomp(tree, scale = TRUE)
str(x)



