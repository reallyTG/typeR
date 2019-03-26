library(apTreeshape)


### Name: as.phylo.treeshape
### Title: Conversion among tree objects
### Aliases: as.phylo.treeshape
### Keywords: manip

### ** Examples


data(primates)
plot(primates)

library(ape)
  
primates.phylo=as.phylo(primates)
plot(primates.phylo)



