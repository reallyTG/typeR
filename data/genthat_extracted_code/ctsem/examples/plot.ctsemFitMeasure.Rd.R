library(ctsem)


### Name: plot.ctsemFitMeasure
### Title: Misspecification plot using ctCheckFit output
### Aliases: plot.ctsemFitMeasure

### ** Examples

## Not run: 
##D data(ctExample1)
##D traitmodel <- ctModel(n.manifest=2, n.latent=2, Tpoints=6, LAMBDA=diag(2), 
##D   manifestNames=c('LeisureTime', 'Happiness'), 
##D   latentNames=c('LeisureTime', 'Happiness'), TRAITVAR="auto")
##D traitfit <- ctFit(datawide=ctExample1, ctmodelobj=traitmodel)
##D 
##D check <- ctCheckFit(traitfit,niter=5)
##D plot(check)
## End(Not run)



