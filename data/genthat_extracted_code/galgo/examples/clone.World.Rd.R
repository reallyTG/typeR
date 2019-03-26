library(galgo)


### Name: clone.World
### Title: Clones itself and its niches
### Aliases: clone.World World.clone clone.World clone,World-method
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



