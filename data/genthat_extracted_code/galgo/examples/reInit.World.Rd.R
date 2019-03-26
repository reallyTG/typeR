library(galgo)


### Name: reInit.World
### Title: Erases all internal values in order to re-use the world object
### Aliases: reInit.World World.reInit reInit.World reInit,World-method
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  wo <- World(niches=newRandomCollection(ni,2))
  wo
  reInit(wo) # it does nothing in this case



