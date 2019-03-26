library(galgo)


### Name: forwardSelectionModels.BigBang
### Title: Gets the "best" models using top-ranked genes and a
###   forward-selection strategy
### Aliases: forwardSelectionModels.BigBang BigBang.forwardSelectionModels
###   forwardSelectionModels.BigBang forwardSelectionModels,BigBang-method
###   forwardSelectionModels
### Keywords: methods internal methods

### ** Examples
## Not run: 
##D    #bb is a BigBang object
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
 


