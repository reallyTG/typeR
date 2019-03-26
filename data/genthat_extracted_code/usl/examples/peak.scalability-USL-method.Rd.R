library(usl)


### Name: peak.scalability,USL-method
### Title: Peak scalability value of a USL model
### Aliases: peak.scalability,USL-method peak.scalability

### ** Examples

require(usl)

data(raytracer)

peak.scalability(usl(throughput ~ processors, raytracer))
## Peak scalability will be reached just below 450 processors




