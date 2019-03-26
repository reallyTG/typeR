library(galgo)


### Name: plot.Niche
### Title: Plots information about niche object
### Aliases: plot.Niche Niche.plot plot.Niche plot,Niche-method
### Keywords: methods internal hplot

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  cr
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  ni
  plot(ni, main="My Niche")
  plot(ni, type="fitness")



