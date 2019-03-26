library(PVR)


### Name: PSR
### Title: Creates a phylogenetic signal-representation (PSR) curve for a
###   given phylogeny and trait set and computes its area.
### Aliases: PSR
### Keywords: phylogenetic signal phylogeny

### ** Examples


library(splancs)
#Creating a 10 tips ultrametric random phylogeny
library(ape)
tree <- rcoal(10)
#Decomposing phylogenetic distance matrix derived from tree into a set of orthogonal vectors
x <- PVRdecomp(tree)
trait <- runif(10)
y <- PSR(x, trait)
summary(y)



