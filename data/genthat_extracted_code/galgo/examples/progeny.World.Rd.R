library(galgo)


### Name: progeny.World
### Title: Calls progeny method to all niches in the world object
### Aliases: progeny.World World.progeny progeny.World progeny,World-method
###   progeny
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  ni$fitness <- runif(10)  ## tricky fitness
  refreshStats(ni)
  ni
  wo <- World(niches=newRandomCollection(ni,2))
  wo$niches[[1]]$fitness <- runif(10)
  wo$niches[[2]]$fitness <- runif(10)
  refreshStats(wo)
  wo
  summary(wo)
  progeny(wo)
  wo
  summary(wo)
  progeny(wo,2)
  wo
  summary(wo)



