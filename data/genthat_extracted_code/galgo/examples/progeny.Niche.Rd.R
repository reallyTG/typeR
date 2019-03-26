library(galgo)


### Name: progeny.Niche
### Title: Performs offspring, crossover, mutation, and elitism mechanism
###   to generate the "evolved" niche
### Aliases: progeny.Niche Niche.progeny progeny.Niche progeny,Niche-method
### Keywords: methods internal methods

### ** Examples

   cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
   cr
   ni <- Niche(chromosomes = newRandomCollection(cr, 10))
   ni
   ni$fitness <- 1:10/10 # tricky fitness, only for showing purposes
   progeny(ni)
   ni
 


