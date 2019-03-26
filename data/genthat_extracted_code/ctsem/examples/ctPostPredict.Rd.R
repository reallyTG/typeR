library(ctsem)


### Name: ctPostPredict
### Title: Posterior predictive type check for ctsemFit.
### Aliases: ctPostPredict

### ** Examples

data("AnomAuth")
AnomAuthmodel <- ctModel(LAMBDA = matrix(c(1, 0, 0, 1), nrow = 2, ncol = 2), 
  Tpoints = 5, n.latent = 2, n.manifest = 2, MANIFESTVAR=diag(0, 2), TRAITVAR = 'auto') 
AnomAuthFit <- ctFit(AnomAuth, AnomAuthmodel)
ctPostPredict(AnomAuthFit,timestep=.5,n.subjects=100)



