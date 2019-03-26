library(galgo)


### Name: pcaModels.BigBang
### Title: Plots models in principal components space
### Aliases: pcaModels.BigBang BigBang.pcaModels pcaModels.BigBang
###   pcaModels,BigBang-method pcaModels
### Keywords: methods internal methods

### ** Examples
## Not run: 
##D    #bb is a BigBang object
##D    pcaModels(bb, bb$bestChromosomes[1])
##D 
##D    fsm <- forwardSelectionModels(bb)
##D    fsm
##D    names(fsm)
##D    heatmapModels(fsm, subset=1)
##D    fsm <- forwardSelectionModels(bb, minFitness=0.9,
##D    fitnessFunc=bb$galgo$fitnessFunc)
##D    heatmapModels(fsm, subset=1)
##D    pcaModels(fsm, subset=1)
##D    fitnessSplits(bb, chromosomes=list(fsm$models[[1]]))
##D    
## End(Not run)
 


