library(PVR)


### Name: PSRplot
### Title: Plot function for objects of class PSR
### Aliases: PSRplot
### Keywords: PSR area PVR

### ** Examples

library(splancs)
#Creating a 10 tips ultrametric random phylogeny
library(ape)
tree <- rcoal(10)
#Decomposing phylogenetic distance matrix derived from tree into a set of orthogonal vectors
x <- PVRdecomp(tree)
trait <- runif(10)
res <- PSR(x, trait = trait, null.model = TRUE, Brownian.model = TRUE, times = 10)
PSRplot(res, info = "both")



