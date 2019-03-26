library(galgo)


### Name: refreshStats.World
### Title: Updates the internal statistics from the current population
### Aliases: refreshStats.World World.refreshStats refreshStats.World
###   refreshStats,World-method
### Keywords: methods internal print

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  ni$fitness <- runif(10)  ## tricky fitness
  ni
  wo <- World(niches=newRandomCollection(ni,2))
  refreshStats(wo)
  summary(wo)



