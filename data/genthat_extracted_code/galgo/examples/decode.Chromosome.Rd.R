library(galgo)


### Name: decode.Chromosome
### Title: Converts the gene values to user-readable values
### Aliases: decode.Chromosome Chromosome.decode decode.Chromosome
###   decode,Chromosome-method decode
### Keywords: methods internal methods

### ** Examples

   cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
   cr
   as.double(cr) # the same
   as.numeric(cr) # the same
   decode(cr) # the same
   as.vector(cr) # NA's is not the same
 


