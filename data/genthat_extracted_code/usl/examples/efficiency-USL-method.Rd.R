library(usl)


### Name: efficiency,USL-method
### Title: Efficiency of the system
### Aliases: efficiency,USL-method efficiency

### ** Examples

require(usl)

data(raytracer)

## Show the efficiency
efficiency(usl(throughput ~ processors, raytracer))




