library(PVR)


### Name: VarPartplot
### Title: Plot function for objects of class PVR to show variation
###   partition components.
### Aliases: VarPartplot
### Keywords: Phylogenetic signal PSR

### ** Examples

library(ape)
tree <- rcoal(10)
#Decomposing phylogenetic distance matrix derived from tree into a set of orthogonal vectors
x <- PVRdecomp(tree)
trait <- runif(10)
envvar <- runif(10)
y <- PVR(x, trait = trait, envVar = envvar, method = "moran")
VarPartplot(y)



