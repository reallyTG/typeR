library(galgo)


### Name: best.Galgo
### Title: Returns the best chromosome
### Aliases: best.Galgo Galgo.best best.Galgo best,Galgo-method best
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes = newRandomCollection(cr, 10))
  wo <- World(niches=newRandomCollection(ni,2))
  ga <- Galgo(populations=newRandomCollection(wo,1), goalFitness = 0.75,
              callBackFunc=plot,
              fitnessFunc=function(chr, parent) 5/sd(as.numeric(chr)))
  evolve(ga) 
  best(ga)
  max(ga)			# the Maximum chromosome may be different to the best
  bestFitness(ga)
  maxFitness(ga)



