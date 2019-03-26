library(ctsem)


### Name: plot.ctsemFit
### Title: Plotting function for object class ctsemFit
### Aliases: plot.ctsemFit

### ** Examples

## Examples set to 'dontrun' because they take longer than 5s.

### example from Driver, Oud, Voelkle (2015), 
### simulated happiness and leisure time with unobserved heterogeneity.
## Not run: 
##D data(ctExample1)
##D traitmodel <- ctModel(n.manifest=2, n.latent=2, Tpoints=6, LAMBDA=diag(2), 
##D   manifestNames=c('LeisureTime', 'Happiness'), 
##D   latentNames=c('LeisureTime', 'Happiness'), TRAITVAR="auto")
##D traitfit <- ctFit(datawide=ctExample1, ctmodelobj=traitmodel)
##D plot(traitfit, wait=FALSE)
## End(Not run)



