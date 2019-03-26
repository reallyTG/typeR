library(galgo)


### Name: World
### Title: The representation of a set of niches with migration for genetic
###   algorithms
### Aliases: World
### Keywords: classes programming methods

### ** Examples

   cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
   ni <- Niche(chromosomes=newRandomCollection(cr, 10))
   wo <- World(niches=newRandomCollection(ni,2))
   wo

   progeny(wo) # returns the chromosomes indexes that were mutated
 


