library(ctsem)


### Name: summary.ctsemFit
### Title: Summary function for ctsemFit object
### Aliases: summary.ctsemFit

### ** Examples

## Examples set to 'dontrun' because they take longer than 5s. 

## Not run: 
##D ### example from Driver, Oud, Voelkle (2015), 
##D ### simulated happiness and leisure time with unobserved heterogeneity.
##D data(ctExample1)
##D traitmodel <- ctModel(n.manifest=2, n.latent=2, Tpoints=6, LAMBDA=diag(2), 
##D   manifestNames=c('LeisureTime', 'Happiness'), 
##D   latentNames=c('LeisureTime', 'Happiness'), TRAITVAR="auto")
##D traitfit <- ctFit(datawide=ctExample1, ctmodelobj=traitmodel)
##D summary(traitfit,timeInterval=1)
## End(Not run)



