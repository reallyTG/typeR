library(ctsem)


### Name: ctCheckFit
### Title: Check absolute fit of ctFit or ctStanFit object.
### Aliases: ctCheckFit

### ** Examples

## Not run: 
##D data(ctExample1)
##D traitmodel <- ctModel(n.manifest=2, n.latent=2, Tpoints=6, LAMBDA=diag(2), 
##D   manifestNames=c('LeisureTime', 'Happiness'), 
##D   latentNames=c('LeisureTime', 'Happiness'), TRAITVAR="auto")
##D traitfit <- ctFit(dat=ctExample1, ctmodelobj=traitmodel)
##D 
##D check <- ctCheckFit(traitfit,niter=5)
##D plot(check)
## End(Not run)



