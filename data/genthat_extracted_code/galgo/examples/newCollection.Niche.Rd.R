library(galgo)


### Name: newCollection.Niche
### Title: Generates a list of cloned niches
### Aliases: newCollection.Niche Niche.newCollection newCollection.Niche
###   newCollection,Niche-method
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  cr
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  ni
  newCollection(ni, 2)                  # list of two new identical Niche objects
  newRandomCollection(ni, 2)            # list of two new different Niche objects



