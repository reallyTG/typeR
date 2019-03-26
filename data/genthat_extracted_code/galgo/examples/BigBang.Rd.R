library(galgo)


### Name: BigBang
### Title: Represents the ensemble of the results of evolving several Galgo
###   objects
### Aliases: BigBang
### Keywords: classes programming methods

### ** Examples

 ## Not run: 
##D    cr <- Chromosome(genes=newCollection(Gene(shape1=1, shape2=100),5))
##D    ni <- Niche(chromosomes=newRandomCollection(cr, 10))
##D    wo <- World(niches=newRandomCollection(ni,2))
##D    ga <- Galgo(populations=newRandomCollection(wo,1), goalFitness = 0.75,
##D 				callBackFunc=plot,
##D                fitnessFunc=function(chr, parent) 5/sd(as.numeric(chr)))
##D  
##D    #evolve(ga) ## not needed here
##D 
##D    bb <- BigBang(galgo=ga, maxSolutions=10, maxBigBangs=10, saveGeneBreaks=1:100)
##D    blast(bb) 
##D    ## it performs 10 times evolve() onto ga object
##D    ## every time, it reinitilize and randomize
##D    ## finally, the results are saved.
##D    plot(bb)
##D  
##D    #it is missing a microarray classification example
##D    
## End(Not run)
 


