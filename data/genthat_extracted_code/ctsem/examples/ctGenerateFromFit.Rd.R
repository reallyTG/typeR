library(ctsem)


### Name: ctGenerateFromFit
### Title: Generates data according to the model estimated in a ctsemFit
###   object.#'
### Aliases: ctGenerateFromFit

### ** Examples


data(AnomAuth) 
AnomAuthmodel <- ctModel(LAMBDA = matrix(c(1, 0, 0, 1), nrow = 2, ncol = 2), 
  Tpoints = 5, n.latent = 2, n.manifest = 2, MANIFESTVAR=diag(0, 2)) 
AnomAuthfit <- ctFit(AnomAuth, AnomAuthmodel)

dwide <- ctGenerateFromFit(AnomAuthfit,timestep=1,n.subjects=5)

par(mfrow=c(1,2))
ctIndplot(datawide = dwide,n.subjects = 5,n.manifest = 2,vars=1,Tpoints = 4)
ctIndplot(datawide = AnomAuth+rnorm(length(AnomAuth)),vars=1,n.subjects = 5,
n.manifest = 2,Tpoints = 4)




