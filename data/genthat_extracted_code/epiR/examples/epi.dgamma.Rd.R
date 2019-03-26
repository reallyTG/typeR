library(epiR)


### Name: epi.dgamma
### Title: Estimate the precision of a [structured] heterogeneity term
### Aliases: epi.dgamma
### Keywords: univar univar

### ** Examples

## Suppose we are expecting the lower 5% and upper 95% confidence interval 
## of relative risk in a data set to be 0.5 and 3.0, respectively. 
## A prior guess at the precision of the heterogeneity term would be:

tau <- epi.dgamma(rr = c(0.5, 3.0), quantiles = c(0.05, 0.95))
tau

## This can be translated into a gamma distribution. We set the mean of the 
## distribution as tau and specify a large variance (that is, we are not 
## certain about tau).

mean <- tau
var <- 1000
shape <- mean^2 / var
inv.scale <- mean / var

## In WinBUGS the precision of the heterogeneity term may be parameterised 
## as tau ~ dgamma(shape, inv.scale). Plot the probability density function
## of tau:

z <- seq(0.01, 10, by = 0.01)
fz <- dgamma(z, shape = shape, scale = 1/inv.scale)
plot(z, fz, type = "l", ylab = "Probability density of tau")





