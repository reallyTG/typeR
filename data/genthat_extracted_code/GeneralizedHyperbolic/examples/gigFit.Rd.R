library(GeneralizedHyperbolic)


### Name: gigFit
### Title: Fit the Generalized Inverse Gausssian Distribution to Data
### Aliases: gigFit print.gigFit plot.gigFit coef.gigFit vcov.gigFit
### Keywords: distribution

### ** Examples

param <- c(1, 1, 1)
dataVector <- rgig(500, param = param)
## See how well gigFit works
gigFit(dataVector)
##gigFit(dataVector, plots = TRUE)

## See how well gigFit works in the limiting cases
## Gamma case
dataVector2 <- rgamma(500, shape = 1, rate = 1)
gigFit(dataVector2)

## Inverse gamma
require(actuar)
dataVector3 <- rinvgamma(500, shape = 1, rate = 1)
gigFit(dataVector3)

## Use nlm instead of default
gigFit(dataVector, method = "nlm")




