library(galgo)


### Name: mutate.Chromosome
### Title: Mutates a chromosome in specific positions
### Aliases: mutate.Chromosome Chromosome.mutate mutate.Chromosome
###   mutate,Chromosome-method
### Keywords: methods internal methods

### ** Examples

   cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
   cr
   mutate(cr) # mutate 1 gene randomly
   cr
   mutate(cr,1:3) # mutate genes 1, 2, and 3
   cr
 


