library(galgo)


### Name: generateRandom.Galgo
### Title: Generates random values for all populations in the Galgo object
### Aliases: generateRandom.Galgo Galgo.generateRandom generateRandom.Galgo
###   generateRandom,Galgo-method generateRandom
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes = newRandomCollection(cr, 10))
  wo <- World(niches=newRandomCollection(ni,2))

  ga <- Galgo(populations=newRandomCollection(wo,1), goalFitness = 0.75,
              callBackFunc=plot,
              fitnessFunc=function(chr, parent) 5/sd(as.numeric(chr)))
  ga
  evolve(ga)
  evolve(ga)  ## nothing
  reInit(ga)
  generateRandom(ga)
  evolve(ga)  ## here we go again



