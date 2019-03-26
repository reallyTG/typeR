library(tsModel)


### Name: ModelTerms
### Title: Model terms for time series models
### Aliases: ModelTerms Lag runMean harmonic
### Keywords: models

### ** Examples

## Ten day "time series"
x <- rnorm(10)

## Lag 1 of `x'
Lag(x, 1)

## Lag 0, 1, and 2 of `x'
Lag(x, 0:2)

## Running mean of lag 0, 1, and 2
runMean(x, 0:2)




