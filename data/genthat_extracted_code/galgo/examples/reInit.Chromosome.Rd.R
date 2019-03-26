library(galgo)


### Name: reInit.Chromosome
### Title: Erases all internal values in order to re-use the object
### Aliases: reInit.Chromosome Chromosome.reInit reInit.Chromosome
###   reInit,Chromosome-method
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  cr
  reInit(cr) # it does nothing in this case
  cr



