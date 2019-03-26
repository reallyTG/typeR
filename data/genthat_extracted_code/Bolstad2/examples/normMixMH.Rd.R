library(Bolstad2)


### Name: normMixMH
### Title: Sample from a normal mixture model using Metropolis-Hastings
### Aliases: normMixMH

### ** Examples

## Set up the normal mixture
theta0 <- c(0,1)
theta1 <- c(3,2)
p <- 0.8

## Sample from an independent N(0,3^2) candidate density
candidate <- c(0, 3)
MCMCsampleInd <- normMixMH(theta0, theta1, p, candidate)


## If we wish to use the alternative random walk N(0, 0.5^2)
## candidate density
candidate <- c(0, 0.5)
MCMCsampleRW <- normMixMH(theta0, theta1, p, candidate, type = 'rw')



