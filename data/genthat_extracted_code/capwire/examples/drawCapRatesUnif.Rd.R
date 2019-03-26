library(capwire)


### Name: drawCapRatesUnif
### Title: Draw Capture Rates from Uniform Distribution
### Aliases: drawCapRatesUnif

### ** Examples

## Specify the distribution

dist <- drawCapRatesUnif(lower=0.01, upper=1)

## Simulate a data set with the capture rates drawn from dist

data <- simCapture(n=30, s=100, dist.func=dist)

data



