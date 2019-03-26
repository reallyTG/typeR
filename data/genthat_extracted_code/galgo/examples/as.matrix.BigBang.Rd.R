library(galgo)


### Name: as.matrix.BigBang
### Title: Prints the representation of the BigBang object
### Aliases: as.matrix.BigBang BigBang.as.matrix as.matrix.BigBang
###   as.matrix,BigBang-method
### Keywords: methods internal print

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
   bb
   print(bb)
   summary(bb)
   ## Not run: as.matrix(bb)
 


