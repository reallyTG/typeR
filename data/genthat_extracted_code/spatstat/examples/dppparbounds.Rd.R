library(spatstat)


### Name: dppparbounds
### Title: Parameter Bound for a Determinantal Point Process Model
### Aliases: dppparbounds
### Keywords: spatial models

### ** Examples

model <- dppMatern(lambda=100, alpha=.01, nu=1, d=2)
dppparbounds(model, "lambda")



