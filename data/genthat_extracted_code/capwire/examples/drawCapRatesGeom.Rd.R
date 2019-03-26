library(capwire)


### Name: drawCapRatesGeom
### Title: Draw Capture Rates from Geometric Distribution
### Aliases: drawCapRatesGeom

### ** Examples

## Specify the distribution

dist <- drawCapRatesGeom(p=0.5)

## Simulate a data set with the capture rates drawn from dist

data <- simCapture(n=30, s=100, dist.func=dist)

data



