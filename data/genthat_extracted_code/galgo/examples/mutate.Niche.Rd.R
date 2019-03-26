library(galgo)


### Name: mutate.Niche
### Title: Mutates a niche calling mutate method for all chromosomes
### Aliases: mutate.Niche Niche.mutate mutate.Niche mutate,Niche-method
### Keywords: methods internal methods

### ** Examples

   cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
   cr
   ni <- Niche(chromosomes = newRandomCollection(cr, 10))
   ni
   mutate(ni, 3)
   ni
 


