library(spatialTailDep)


### Name: AsymVar
### Title: Function 'AsymVar'
### Aliases: AsymVar

### ** Examples

## Define the locations of three stations
(locations <- rbind(c(1.0,1.0),c(2.0,1.0),c(1.2,2.5)))
## select pairs
(pairIndices <- selectPairIndices(locations, maxDistance = 3))
(pairs <- pairCoordinates(locations, pairIndices))
## Smith model parameter matrix
(theta <- rbind(c(1.5, .5), c(.5, 1)))
## The matrix. Takes a couple of seconds to compute.
## AsymVar(pairs, model = "smith", theta = theta, Tol = 1e-04)

## Parameters of the Brown-Resnick process
(theta <- c(1.5,1,0.5,0.25))
## The matrix. Takes a couple of seconds to compute.
## AsymVar(pairs, model = "BR", theta = theta, Tol = 1e-04)



