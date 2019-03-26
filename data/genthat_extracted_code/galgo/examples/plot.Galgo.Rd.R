library(galgo)


### Name: plot.Galgo
### Title: Plots information about the Galgo object
### Aliases: plot.Galgo Galgo.plot plot.Galgo plot,Galgo-method
### Keywords: methods internal hplot

### ** Examples

  wo <- World(niches=newRandomCollection(Niche(chromosomes=
                     newRandomCollection(Chromosome(genes=
                     newCollection(Gene(shape1=1, shape2=100),5)),
                     10),2),2))
  ga <- Galgo(populations=newRandomCollection(wo,1), goalFitness = 0.75,
              callBackFunc=plot,
              fitnessFunc=function(chr, parent) 5/sd(as.numeric(chr)))
  evolve(ga) 
  best(ga)
  bestFitness(ga)
  plot(ga)

  reInit(ga)
  generateRandom(ga)
  evolve(ga)
  best(ga)
  bestFitness(ga)
  plot(ga)



