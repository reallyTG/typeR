library(galgo)


### Name: refreshStats.Niche
### Title: Updates the internal values from the current population
### Aliases: refreshStats.Niche Niche.refreshStats refreshStats.Niche
###   refreshStats,Niche-method
### Keywords: methods internal print

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  cr
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  ni
  summary(ni) # not so much
  ni$fitness <- runif(10)  ## tricky fitness
  refreshStats(ni)
  summary(ni) # new updated values
  ni$fitness <- runif(10)  ## new tricky fitness
  refreshStats(ni)
  summary(ni) # may be some new updated values



