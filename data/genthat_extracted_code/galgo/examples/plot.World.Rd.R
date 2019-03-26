library(galgo)


### Name: plot.World
### Title: Plots information about world object
### Aliases: plot.World World.plot plot.World plot,World-method
### Keywords: methods internal hplot

### ** Examples

   cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
   ni <- Niche(chromosomes=newRandomCollection(cr, 10))
   ni$fitness <- runif(10)  ## tricky fitness
   ni
   wo <- World(niches=newRandomCollection(ni,2))
   refreshStats(wo)
   plot(wo, main="My Niche")
   plot(wo, type="fitness")
 


