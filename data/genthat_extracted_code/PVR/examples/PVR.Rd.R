library(PVR)


### Name: PVR
### Title: Phylogenetic eigenvectors regression.
### Aliases: PVR
### Keywords: Phylogenetic signal Phylogenetic models

### ** Examples


library(ape)
tree <- rcoal(10)
#Decomposing phylogenetic distance matrix derived from tree into a set of orthogonal vectors
x <- PVRdecomp(tree)
trait <- runif(10)
y <- PVR(x, trait = trait, method = "moran")
str(y)



