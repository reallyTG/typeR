library(galgo)


### Name: bestFitness.Galgo
### Title: Returns the fitness of the best chromosome
### Aliases: bestFitness.Galgo Galgo.bestFitness bestFitness.Galgo
###   bestFitness,Galgo-method bestFitness
### Keywords: methods internal methods

### ** Examples

  wo <- World(niches=newRandomCollection(Niche(chromosomes=newRandomCollection(
        Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5)), 10),2),2))
  ga <- Galgo(populations=newRandomCollection(wo,1), goalFitness = 0.75,
              callBackFunc=plot,
              fitnessFunc=function(chr, parent) 5/sd(as.numeric(chr)))
  evolve(ga) 
  best(ga)
  max(ga)			# the Maximum chromosome may be different to the best
  bestFitness(ga)
  maxFitness(ga)



