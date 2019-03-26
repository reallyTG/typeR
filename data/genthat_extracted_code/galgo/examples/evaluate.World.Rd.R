library(galgo)


### Name: evaluate.World
### Title: Evaluate all niches with a fitness function
### Aliases: evaluate.World World.evaluate evaluate.World
###   evaluate,World-method
### Keywords: methods internal methods

### ** Examples

   cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
   cr
   ni <- Niche(chromosomes = newRandomCollection(cr, 10))
   ni
   fn <- function(chr, parent) { sd(as.double(chr))/mean(as.double(chr)) }
   evaluate(ni, fn, parent)
   getFitness(ni) ## see results
   summary(ni)
   wo <- World(niches=newRandomCollection(ni,2))
   evaluate(wo, fn, parent)
 


