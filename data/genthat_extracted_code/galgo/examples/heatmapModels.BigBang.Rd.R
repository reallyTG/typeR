library(galgo)


### Name: heatmapModels.BigBang
### Title: Plots models using heatmap plot
### Aliases: heatmapModels.BigBang BigBang.heatmapModels
###   heatmapModels.BigBang heatmapModels,BigBang-method heatmapModels
### Keywords: methods internal methods

### ** Examples
## Not run: 
##D    #bb is a BigBang object
##D    heatmapModels(bb, bb$bestChromosomes[1])
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
 


