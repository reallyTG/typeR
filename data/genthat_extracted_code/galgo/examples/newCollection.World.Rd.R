library(galgo)


### Name: newCollection.World
### Title: Generates a list cloning an object
### Aliases: newCollection.World World.newCollection newCollection.World
###   newCollection,World-method newCollection
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  ni$fitness <- runif(10)  ## tricky fitness
  ni
  wo <- World(niches=newRandomCollection(ni,2))
  newCollection(wo, 2)                  # list of two new identical World objects
  newRandomCollection(wo, 2)            # list of two new different World objects



