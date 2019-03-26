library(galgo)


### Name: reInit.Niche
### Title: Erases all internal values in order to re-use the object
### Aliases: reInit.Niche Niche.reInit reInit.Niche reInit,Niche-method
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  ni
  reInit(ni) # it does nothing in this case



