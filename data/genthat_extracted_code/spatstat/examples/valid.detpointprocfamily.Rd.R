library(spatstat)


### Name: valid.detpointprocfamily
### Title: Check Validity of a Determinantal Point Process Model
### Aliases: valid.detpointprocfamily
### Keywords: spatial models

### ** Examples

model1 <- dppMatern(lambda=100, alpha=.01, nu=1, d=2)
valid(model1)
model2 <- dppMatern(lambda=100, alpha=1, nu=1, d=2)
valid(model2)



