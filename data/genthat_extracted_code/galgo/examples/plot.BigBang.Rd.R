library(galgo)


### Name: plot.BigBang
### Title: Plots about the collected information in a BigBang object
### Aliases: plot.BigBang BigBang.plot plot.BigBang plot,BigBang-method
### Keywords: methods internal hplot

### ** Examples
## Not run: 
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
##D    blast(bb)
##D    plot(bb)
##D    plot(bb, type=c("fitness","genefrequency"))
##D    plot(bb, type="generations")
##D    
## End(Not run)
 


