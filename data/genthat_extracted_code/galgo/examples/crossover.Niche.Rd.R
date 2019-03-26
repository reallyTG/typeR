library(galgo)


### Name: crossover.Niche
### Title: Performs crossover between chromosomes of the niche
### Aliases: crossover.Niche Niche.crossover crossover.Niche
###   crossover,Niche-method crossover
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  cr
  ni <- Niche(chromosomes = newRandomCollection(cr, 10))
  ni
  crossover(ni)
  ni



