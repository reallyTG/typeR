library(galgo)


### Name: summary.Galgo
### Title: Prints the representation and statistics of the galgo object
### Aliases: summary.Galgo Galgo.summary summary.Galgo summary,Galgo-method
### Keywords: methods internal print

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes = newRandomCollection(cr, 10))
  wo <- World(niches=newRandomCollection(ni,2))

  ga <- Galgo(populations=newRandomCollection(wo,1), goalFitness = 0.75,
              callBackFunc=plot,
              fitnessFunc=function(chr, parent) 5/sd(as.numeric(chr)))
  ga
  summary(ga)
  evolve(ga)
  summary(ga)



