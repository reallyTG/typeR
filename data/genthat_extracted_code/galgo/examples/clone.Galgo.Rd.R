library(galgo)


### Name: clone.Galgo
### Title: Clones itself and all its objects
### Aliases: clone.Galgo Galgo.clone clone.Galgo clone,Galgo-method clone
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes = newRandomCollection(cr, 10))
  wo <- World(niches=newRandomCollection(ni,2))

  ga <- Galgo(populations=newRandomCollection(wo,1), goalFitness = 0.75, callBackFunc=plot,
              fitnessFunc=function(chr, parent) 5/sd(as.numeric(chr)))
  ga
  ga2 <- clone(ga)
  evolve(ga)
  evolve(ga2)
  ga3 <- clone(ga)
  evolve(ga3) # really nothing, everything already done



