library(galgo)


### Name: as.double.Chromosome
### Title: Converts the chromosome values (genes) to its numerical
###   representation
### Aliases: as.double.Chromosome Chromosome.as.double as.double.Chromosome
###   as.double,Chromosome-method
### Keywords: methods internal methods

### ** Examples

   cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
   cr
   as.double(cr) # the same
   as.numeric(cr) # the same
   as.vector(cr) # NA's is not the same
 


