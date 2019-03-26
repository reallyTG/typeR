library(prinsimp)


### Name: simpart
### Title: Simple Partition
### Aliases: simpart simpart.default simpart.formula
### Keywords: multivariate

### ** Examples

library(prinsimp)
require(graphics)

## Caterpillar data: estimated covariance from Kingsolver et al (2004)
## Measurements are at temperatures 11, 17, 23, 29, 35, 40
data(caterpillar)

## Analyze 5 dimensional model space, 1 dimensional nearly null space
## First divided difference simplicity measure
simpart(caterpillar, simpledim=1, cov=TRUE)  # Need to specify x

simpart(caterpillar, simpledim=1,
        x=c(11, 17, 23, 29, 35, 40), cov=TRUE)

## Second divided difference simplicity measure and 3-dimensional model space
simpart(caterpillar, simpledim=3, measure="second",
        x=c(11, 17, 23, 29, 35, 40), cov=TRUE)



