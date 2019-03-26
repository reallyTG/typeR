library(galgo)


### Name: Galgo
### Title: The representation of a Genetic Algorithm
### Aliases: Galgo
### Keywords: classes programming methods

### ** Examples

   cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
   ni <- Niche(chromosomes = newRandomCollection(cr, 10))
   wo <- World(niches=newRandomCollection(ni,2))
   ga <- Galgo(populations=list(wo), goalFitness = 0.75, callBackFunc=plot,
               fitnessFunc=function(chr, parent) 5/sd(as.numeric(chr)))
   ga
   evolve(ga)

   # missing a classification example
 


