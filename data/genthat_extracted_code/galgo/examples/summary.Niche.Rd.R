library(galgo)


### Name: summary.Niche
### Title: Prints the representation and statistics of the niche object
### Aliases: summary.Niche Niche.summary summary.Niche summary,Niche-method
### Keywords: methods internal print

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  cr
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  ni
  print(ni) # the same
  summary(ni) # expanded view



