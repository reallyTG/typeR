library(bamlss)


### Name: MVNORM
### Title: Create Samples for BAMLSS by Multivariate Normal Approximation
### Aliases: MVNORM
### Keywords: regression

### ** Examples

## Simulated data example illustrating
## how to call the sampler function.
## This is done internally within
## the setup of function bamlss().
d <- GAMart()
f <- num ~ s(x1, bs = "ps")
bf <- bamlss.frame(f, data = d, family = "gaussian")

## First, find starting values with optimizer.
o <- with(bf, bfit(x, y, family))

## Sample.
samps <- with(bf, MVNORM(x, y, family, start = o$parameters))
plot(samps)



