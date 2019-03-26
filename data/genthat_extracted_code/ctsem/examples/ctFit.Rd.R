library(ctsem)


### Name: ctFit
### Title: Fit a ctsem object
### Aliases: ctFit

### ** Examples

## Examples set to 'dontrun' because they take longer than 5s.
## Not run: 
##D mfrowOld<-par()$mfrow
##D par(mfrow=c(2, 3))
##D 
##D ### example from Driver, Oud, Voelkle (2017), 
##D ### simulated happiness and leisure time with unobserved heterogeneity.
##D data(ctExample1)
##D traitmodel <- ctModel(n.manifest=2, n.latent=2, Tpoints=6, LAMBDA=diag(2), 
##D   manifestNames=c('LeisureTime', 'Happiness'), 
##D   latentNames=c('LeisureTime', 'Happiness'), TRAITVAR="auto")
##D traitfit <- ctFit(dat=ctExample1, ctmodelobj=traitmodel)
##D summary(traitfit)
##D plot(traitfit, wait=FALSE)
##D 
##D 
##D ###Example from Voelkle, Oud, Davidov, and Schmidt (2012) - anomia and authoritarianism.  
##D data(AnomAuth) 
##D AnomAuthmodel <- ctModel(LAMBDA = matrix(c(1, 0, 0, 1), nrow = 2, ncol = 2), 
##D Tpoints = 5, n.latent = 2, n.manifest = 2, MANIFESTVAR=diag(0, 2), TRAITVAR = NULL) 
##D AnomAuthfit <- ctFit(AnomAuth, AnomAuthmodel)
##D summary(AnomAuthfit)
##D 
##D 
##D ### Single subject time series - using Kalman filter (OpenMx statespace expectation)
##D data('ctExample3')
##D model <- ctModel(n.latent = 1, n.manifest = 3, Tpoints = 100, 
##D   LAMBDA = matrix(c(1, 'lambda2', 'lambda3'), nrow = 3, ncol = 1), 
##D   CINT= matrix('cint'),
##D   MANIFESTMEANS = matrix(c(0, 'manifestmean2', 'manifestmean3'), nrow = 3, 
##D     ncol = 1))
##D fit <- ctFit(dat = ctExample3, ctmodelobj = model, objective = 'Kalman', 
##D   stationary = c('T0VAR'))
##D 
##D 
##D ###Oscillating model from Voelkle & Oud (2013). 
##D data("Oscillating")
##D 
##D inits <- c(-39, -.3, 1.01, 10.01, .1, 10.01, 0.05, .9, 0)
##D names(inits) <- c("crosseffect","autoeffect", "diffusion",
##D   "T0var11", "T0var21", "T0var22","m1", "m2", 'manifestmean')
##D 
##D oscillatingm <- ctModel(n.latent = 2, n.manifest = 1, Tpoints = 11,
##D   MANIFESTVAR = matrix(c(0), nrow = 1, ncol = 1),
##D   LAMBDA = matrix(c(1, 0), nrow = 1, ncol = 2),
##D   T0MEANS = matrix(c('m1', 'm2'), nrow = 2, ncol = 1),
##D   T0VAR = matrix(c("T0var11", "T0var21", 0, "T0var22"), nrow = 2, ncol = 2),
##D   DRIFT = matrix(c(0, "crosseffect", 1, "autoeffect"), nrow = 2, ncol = 2),
##D   CINT = matrix(0, ncol = 1, nrow = 2),
##D   MANIFESTMEANS = matrix('manifestmean', nrow = 1, ncol = 1),
##D   DIFFUSION = matrix(c(0, 0, 0, "diffusion"), nrow = 2, ncol = 2),
##D   startValues=inits)
##D 
##D oscillatingf <- ctFit(Oscillating, oscillatingm, carefulFit = FALSE)
## End(Not run)



