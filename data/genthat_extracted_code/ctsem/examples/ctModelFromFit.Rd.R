library(ctsem)


### Name: ctModelFromFit
### Title: Extract a ctsem model structure with parameter values from a
###   ctsem fit object.
### Aliases: ctModelFromFit

### ** Examples

data(AnomAuth) 
AnomAuthmodel <- ctModel(LAMBDA = matrix(c(1, 0, 0, 1), nrow = 2, ncol = 2), 
  Tpoints = 5, n.latent = 2, n.manifest = 2, MANIFESTVAR=diag(0, 2)) 
AnomAuthfit <- ctFit(AnomAuth, AnomAuthmodel)

fitmodel <- ctModelFromFit(AnomAuthfit)



