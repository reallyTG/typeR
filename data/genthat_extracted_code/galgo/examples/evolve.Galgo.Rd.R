library(galgo)


### Name: evolve.Galgo
### Title: Evolves the chromosomes populations of a Galgo (Genetic
###   Algorithm)
### Aliases: evolve.Galgo Galgo.evolve evolve.Galgo evolve,Galgo-method
###   evolve
### Keywords: methods internal methods

### ** Examples

  wo <- World(niches=newRandomCollection(Niche(chromosomes=newRandomCollection(
  Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5)), 10),2),2))
  ga <- Galgo(populations=newRandomCollection(wo,1), goalFitness = 0.75,
              callBackFunc=plot,
              fitnessFunc=function(chr, parent) 5/sd(as.numeric(chr)))
  evolve(ga) 
  best(ga)
  bestFitness(ga)



