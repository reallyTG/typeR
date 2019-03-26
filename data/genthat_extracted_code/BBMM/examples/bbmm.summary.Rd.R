library(BBMM)


### Name: bbmm.summary
### Title: Summary of a Brownian bridge movement model fit
### Aliases: bbmm.summary
### Keywords: ~brownian.bridge

### ** Examples

data(locations)
BBMM <- brownian.bridge(x=locations$x, y=locations$y, 
            time.lag=locations$time.lag[-1], location.error=20, 
            cell.size=50)
bbmm.summary(BBMM)



