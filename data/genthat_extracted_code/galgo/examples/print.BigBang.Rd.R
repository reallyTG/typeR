library(galgo)


### Name: print.BigBang
### Title: Prints the representation of a BigBang object
### Aliases: print.BigBang BigBang.print print.BigBang print,BigBang-method
###   print
### Keywords: methods internal print

### ** Examples
## Not run: 
##D    
##D    cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
##D    ni <- Niche(chromosomes=newRandomCollection(cr, 10))
##D    wo <- World(niches=newRandomCollection(ni,2))
##D    ga <- Galgo(populations=newRandomCollection(wo,1), goalFitness = 0.75,
##D                callBackFunc=plot,
##D                fitnessFunc=function(chr, parent) 5/sd(as.numeric(chr)))
##D  
##D    #evolve(ga) ## not needed here
##D 
##D    bb <- BigBang(galgo=ga, maxSolutions=10, maxBigBangs=10, saveGeneBreaks=1:100)
##D    blast(bb, 1)
##D    bb
##D    print(bb)
##D    summary(bb)
##D    
## End(Not run)
 


