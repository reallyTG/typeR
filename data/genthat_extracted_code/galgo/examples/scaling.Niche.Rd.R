library(galgo)


### Name: scaling.Niche
### Title: Assigns a weight for every chromosome to be selected for the
###   next generation
### Aliases: scaling.Niche Niche.scaling scaling.Niche scaling,Niche-method
###   scaling
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
 


