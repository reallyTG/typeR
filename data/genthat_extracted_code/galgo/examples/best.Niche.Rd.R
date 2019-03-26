library(galgo)


### Name: best.Niche
### Title: Returns the best chromosome of the niche
### Aliases: best.Niche Niche.best best.Niche best,Niche-method
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  cr
  ni <- Niche(chromosomes = newRandomCollection(cr, 10))
  ni$fitness <- 1:10/10 # tricky fitness
  refreshStats(ni)      # compute best and max chromosomes
  summary(ni)
  best(ni)
  ni$bestChromosome     # the same
  max(ni)               # the same in this case
  bestFitness(ni)       # 1
  maxFitness(ni)        # 1



