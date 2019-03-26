library(semds)


### Name: semds
### Title: Structural Equation Multidimensional Scaling
### Aliases: semds print.semds plot.semds summary.semds
### Keywords: models

### ** Examples

## asymmetric model 
fit2way <- semds(Miller)
fit2way
summary(fit2way)
plot(fit2way)


## asymmetric model (saturated)
fit2wayS <- semds(Miller, saturated = TRUE)
fit2wayS
fit2wayS$theta

## general three-way model
fitmway <- semds(BrahmsNorm)
fitmway
summary(fitmway)
plot(fitmway)




