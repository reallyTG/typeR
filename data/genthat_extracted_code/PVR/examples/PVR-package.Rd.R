library(PVR)


### Name: PVR-package
### Title: Computes *P*hylogenetic eigen*V*ectors *R*egression and
###   *P*hylogentic *S*ignal-*R*epresentation curve (with null and neutral
###   expectations).
### Aliases: PVR-package
### Keywords: package

### ** Examples

library(splancs)
#Creating a 10 tips ultrametric random phylogeny
library(ape)
tree <- rcoal(10)
#Decomposing phylogenetic distance matrix derived from tree into a set of orthogonal vectors
x <- PVRdecomp(tree)
trait <- runif(10)
y <- PSR(x, trait)
y



