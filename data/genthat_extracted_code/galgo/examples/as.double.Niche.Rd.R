library(galgo)


### Name: as.double.Niche
### Title: Converts the chromosome values (genes) to a vector
### Aliases: as.double.Niche Niche.as.double as.double.Niche
###   as.double,Niche-method
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  ni
  as.double(ni)
  as.double(as.matrix(ni))  # the same
  as.numeric(ni) # the same
  as.vector(ni) # NA is definitively NOT the same



