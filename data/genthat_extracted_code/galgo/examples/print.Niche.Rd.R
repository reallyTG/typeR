library(galgo)


### Name: print.Niche
### Title: Prints the representation of a niche object
### Aliases: print.Niche Niche.print print.Niche print,Niche-method
### Keywords: methods internal print

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  cr
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  ni
  print(ni) # the same



