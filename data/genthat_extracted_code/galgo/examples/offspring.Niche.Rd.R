library(galgo)


### Name: offspring.Niche
### Title: Overwrites the new niche selecting a new population from the
###   best chromosomes
### Aliases: offspring.Niche Niche.offspring offspring.Niche
###   offspring,Niche-method offspring
### Keywords: methods internal methods

### ** Examples

   cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
   cr
   ni <- Niche(chromosomes = newRandomCollection(cr, 10))
   ni
   ni$fitness <- 1:10/10 # tricky fitness, only for showing purposes
   scaling(ni)
   offspring(ni)
   ni
 


