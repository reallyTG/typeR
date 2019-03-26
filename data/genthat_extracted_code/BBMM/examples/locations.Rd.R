library(BBMM)


### Name: locations
### Title: Example data for the Brownian bridge movement model function in
###   package BBMM.
### Aliases: locations
### Keywords: datasets

### ** Examples

data(locations)
BBMM <- brownian.bridge(x=locations$x, y=locations$y, 
            time.lag=locations$time.lag[-1], location.error=20, 
            cell.size=50)
bbmm.summary(BBMM)



