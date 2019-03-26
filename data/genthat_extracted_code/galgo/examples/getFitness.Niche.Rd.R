library(galgo)


### Name: getFitness.Niche
### Title: Returns the fitness vector related to chromosomes
### Aliases: getFitness.Niche Niche.getFitness getFitness.Niche
###   getFitness,Niche-method getFitness
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  cr
  ni <- Niche(chromosomes = newRandomCollection(cr, 10))
  ni$fitness <- 1:10/10 # tricky fitness, instead of evaluating in a Galgo object
  refreshStats(ni)      # compute best and max chromosomes
  summary(ni)
  getFitness(ni)



