library(galgo)


### Name: refreshStats.Galgo
### Title: Updates the internal values from the current populations
### Aliases: refreshStats.Galgo Galgo.refreshStats refreshStats.Galgo
###   refreshStats,Galgo-method refreshStats
### Keywords: methods internal print

### ** Examples

   cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
   ni <- Niche(chromosomes = newRandomCollection(cr, 10))
   wo <- World(niches=newRandomCollection(ni,2))

   ga <- Galgo(populations=newRandomCollection(wo,1), goalFitness = 0.75,
               callBackFunc=plot,
               fitnessFunc=function(chr, parent) 5/sd(as.numeric(chr)))
   ga
   summary(ga)
   evaluate(ga) # manual evaluation
   ga$generation <- ga$generation + 1
   ga
   refreshStats(ga)
   ga           # updated values
   summary(ga)  # but chromosomes have not been "evolved"
 
 


