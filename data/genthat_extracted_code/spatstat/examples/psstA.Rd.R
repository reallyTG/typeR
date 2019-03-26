library(spatstat)


### Name: psstA
### Title: Pseudoscore Diagnostic For Fitted Model against Area-Interaction
###   Alternative
### Aliases: psstA
### Keywords: spatial models

### ** Examples

   pso <- spatstat.options(psstA.ngrid=16,psstA.nr=10)
   X <- rStrauss(200,0.1,0.05)
   plot(psstA(X))
   plot(psstA(X, interaction=Strauss(0.05)))
   spatstat.options(pso)



