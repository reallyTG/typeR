library(capwire)


### Name: drawCapRatesBeta
### Title: Draw Capture Rates from Beta Distribution
### Aliases: drawCapRatesBeta

### ** Examples

## Specify the distribution

dist <- drawCapRatesBeta(shape1=1, shape2=0.5)

## Simulate a data set with the capture rates drawn from dist

data <- simCapture(n=30, s=100, dist.func=dist)

data



