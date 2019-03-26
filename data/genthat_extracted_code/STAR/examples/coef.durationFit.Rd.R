library(STAR)


### Name: coef.durationFit
### Title: Utility Functions for durationFit Objects
### Aliases: coef.durationFit logLik.durationFit is.durationFit
### Keywords: distribution ts

### ** Examples

## Not run: 
##D ## load CAL1S data
##D data(CAL1S)
##D ## convert the data into spikeTrain objects
##D CAL1S <- lapply(CAL1S,as.spikeTrain)
##D ## look at the train of the 1sd neuron
##D CAL1S[["neuron 1"]]
##D ## fit a invgauss model to the 1st neuron spike train
##D n1SDFig <- invgaussMLE(CAL1S[["neuron 1"]])
##D is.durationFit(n1SDFig)
##D coef(n1SDFig)
##D logLik(n1SDFig)
## End(Not run)



