library(galgo)


### Name: summary.World
### Title: Prints the representation and statistics of the world object
### Aliases: summary.World World.summary summary.World summary,World-method
### Keywords: methods internal print

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes=newRandomCollection(cr, 10))
  wo <- World(niches=newRandomCollection(ni,2))
  wo
  summary(wo)



