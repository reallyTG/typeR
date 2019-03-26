library(capwire)


### Name: drawCapRatesGamma
### Title: Draw Capture Rates from Gamma Distribution
### Aliases: drawCapRatesGamma

### ** Examples

## Specify the distribution

dist <- drawCapRatesGamma(shape=0.5, rate=0.5)

## Simulate a data set with the capture rates drawn from dist

data <- simCapture(n=30, s=100, dist.func=dist)

data



