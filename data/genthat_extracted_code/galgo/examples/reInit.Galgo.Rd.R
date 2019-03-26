library(galgo)


### Name: reInit.Galgo
### Title: Erases all internal values in order to re-use the object
### Aliases: reInit.Galgo Galgo.reInit reInit.Galgo reInit,Galgo-method
###   reInit
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



