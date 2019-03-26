library(galgo)


### Name: length.Galgo
### Title: Gets the number of populations defined in the Galgo object
### Aliases: length.Galgo Galgo.length length.Galgo length,Galgo-method
###   length
### Keywords: methods internal methods

### ** Examples

  cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
  ni <- Niche(chromosomes = newRandomCollection(cr, 10))
  wo <- World(niches=newRandomCollection(ni,2))

  ga <- Galgo(populations=newRandomCollection(wo,1), goalFitness = 0.75,
              callBackFunc=plot,
              fitnessFunc=function(chr, parent) 5/sd(as.numeric(chr)))
  length(ga) ## 1



