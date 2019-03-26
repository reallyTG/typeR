library(galgo)


### Name: as.matrix.Niche
### Title: Converts the chromosome values (genes) to a matrix
### Aliases: as.matrix.Niche Niche.as.matrix as.matrix.Niche
###   as.matrix,Niche-method
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  ni
  as.matrix(ni) # almost the same



