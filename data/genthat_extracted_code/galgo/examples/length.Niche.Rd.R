library(galgo)


### Name: length.Niche
### Title: Gets the number of chromosomes defined in the niche
### Aliases: length.Niche Niche.length length.Niche length,Niche-method
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  ni
  length(ni)



