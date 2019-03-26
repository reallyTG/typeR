library(BBMM)


### Name: brownian.motion.variance
### Title: Brownian motion variance
### Aliases: brownian.motion.variance
### Keywords: ~Brownian ~motion ~variance

### ** Examples

data(locations)
BBMM <- brownian.bridge(x=locations$x, y=locations$y, 
            time.lag=locations$time.lag[-1], location.error=20, 
            cell.size=50)



