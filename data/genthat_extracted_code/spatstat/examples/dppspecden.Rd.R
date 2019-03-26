library(spatstat)


### Name: dppspecden
### Title: Extract Spectral Density from Determinantal Point Process Model
###   Object
### Aliases: dppspecden
### Keywords: spatial models

### ** Examples

model <- dppMatern(lambda = 100, alpha=.01, nu=1, d=2)
dppspecden(model)



