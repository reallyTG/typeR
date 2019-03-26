library(galgo)


### Name: blast.BigBang
### Title: Evolves Galgo objects saving the results for further analysis
### Aliases: blast.BigBang BigBang.blast blast.BigBang blast,BigBang-method
###   blast
### Keywords: methods internal methods

### ** Examples

   cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
   ni <- Niche(chromosomes=newRandomCollection(cr, 10))
   wo <- World(niches=newRandomCollection(ni,2))
   ga <- Galgo(populations=newRandomCollection(wo,1), goalFitness = 0.75,
				callBackFunc=plot,
               fitnessFunc=function(chr, parent) 5/sd(as.numeric(chr)))
 
   #evolve(ga) ## not needed here

   bb <- BigBang(galgo=ga, maxSolutions=10, maxBigBangs=10, saveGeneBreaks=1:100)
   ## Not run: blast(bb)
   ## Not run: plot(bb)
   ## Not run: blast(bb, 1)
   ## Not run: plot(bb)
 


