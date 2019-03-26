library(capwire)


### Name: drawCapRatesExp
### Title: Draw Capture Rates from Exponential Distribution
### Aliases: drawCapRatesExp

### ** Examples

## Specify the distribution

dist <- drawCapRatesExp(r=0.5)

## Simulate a data set with the capture rates drawn from dist

data <- simCapture(n=30, s=100, dist.func=dist)

data



