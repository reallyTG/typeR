library(usl)


### Name: overhead,USL-method
### Title: Overhead method for Universal Scalability Law models
### Aliases: overhead,USL-method overhead

### ** Examples

require(usl)

data(raytracer)

## Print overhead in processing time for demo dataset
overhead(usl(throughput ~ processors, raytracer))




