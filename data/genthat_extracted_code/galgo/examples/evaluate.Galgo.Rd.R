library(galgo)


### Name: evaluate.Galgo
### Title: Evaluates all chromosomes with a fitness function
### Aliases: evaluate.Galgo Galgo.evaluate evaluate.Galgo
###   evaluate,Galgo-method evaluate
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes = newRandomCollection(cr, 10))
  wo <- World(niches=newRandomCollection(ni,2))

  ga <- Galgo(populations=newRandomCollection(wo,1), goalFitness = 0.75,
              callBackFunc=plot,
              fitnessFunc=function(chr, parent) 5/sd(as.numeric(chr)))
  ga
  summary(ga)
  evaluate(ga) # manual evaluation
  ga$generation <- ga$generation + 1
  ga
  refreshStats(ga)
  ga           # updated values
  summary(ga)  # but chromosomes have not been "evolved"

  evolve(ga) 
  # the usual evaluation of fitness function is inside evolve method



