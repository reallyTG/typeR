library(galgo)


### Name: generateRandom.World
### Title: Generates random values for all niches in the world
### Aliases: generateRandom.World World.generateRandom generateRandom.World
###   generateRandom,World-method
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  wo <- World(niches=newRandomCollection(ni,2))
  wo
  wo2 <- wo
  generateRandom(wo2)
  wo2
  wo			# wo and wo2 are the very same object
  wo3 <- clone(wo2)
  generateRandom(wo3)
  wo3
  wo2			# now wo2 is different to wo3
  wo			# but wo2 is still the same than wo



