library(galgo)


### Name: length.World
### Title: Gets the number of niches defined in the world
### Aliases: length.World World.length length.World length,World-method
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  wo <- World(niches=newRandomCollection(ni,2))
  wo
  length(wo)



