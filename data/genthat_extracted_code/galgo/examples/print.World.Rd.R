library(galgo)


### Name: print.World
### Title: Prints the representation of a world object
### Aliases: print.World World.print print.World print,World-method
### Keywords: methods internal print

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  wo <- World(niches=newRandomCollection(ni,2))
  wo
  print(wo) # the same



