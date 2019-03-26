library(galgo)


### Name: bestFitness.World
### Title: Returns the fitness of the best chromosome
### Aliases: bestFitness.World World.bestFitness bestFitness.World
###   bestFitness,World-method
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  ni$fitness <- runif(10)  ## tricky fitness
  ni
  wo <- World(niches=newRandomCollection(ni,2))
  refreshStats(wo)
  best(wo)
  max(wo)
  bestFitness(wo)
  maxFitness(wo)



