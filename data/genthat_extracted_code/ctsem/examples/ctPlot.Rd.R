library(ctsem)


### Name: ctPlot
### Title: ctPlot
### Aliases: ctPlot

### ** Examples

## Examples set to 'dontrun' because they take longer than 5s.

### example from Driver, Oud, Voelkle (2016), 
### simulated happiness and leisure time with unobserved heterogeneity.
## Not run: 
##D data(ctExample1)
##D traitmodel <- ctModel(n.manifest=2, n.latent=2, Tpoints=6, LAMBDA=diag(2), 
##D   manifestNames=c('LeisureTime', 'Happiness'), 
##D   latentNames=c('LeisureTime', 'Happiness'), TRAITVAR="auto")
##D traitfit <- ctFit(dat=ctExample1, ctmodelobj=traitmodel)
##D ctPlot(traitfit, plotType='CR', xlim=c(0,5),ylim=c(-1,1))
## End(Not run)



