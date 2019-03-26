library(usl)


### Name: plot,USL-method
### Title: Plot the scalability function from a USL model
### Aliases: plot,USL-method

### ** Examples

require(usl)

data(raytracer)

## Plot result from USL model for demo dataset
plot(usl(throughput ~ processors, raytracer))




