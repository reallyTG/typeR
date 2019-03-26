library(usl)


### Name: summary,USL-method
### Title: USL Object Summary
### Aliases: summary,USL-method

### ** Examples

require(usl)

data(raytracer)

## Show summary for demo dataset
summary(usl(throughput ~ processors, raytracer))

## Extract model coefficients
summary(usl(throughput ~ processors, raytracer))$coefficients




