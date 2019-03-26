library(ctmm)


### Name: projection
### Title: Projection
### Aliases: projection,telemetry-method projection<-,telemetry-method
###   projection,ctmm-method projection,UD-method projection,list-method
###   projection<-,list-method median median.telemetry

### ** Examples

# Load package and data
library(ctmm)
data(buffalo)

# Apply a 1-point projection that preserves North==up
projection(buffalo) <- median(buffalo)
plot(buffalo)

# Apply a 2-point projection better for elongated disributions
projection(buffalo) <- median(buffalo,k=2)
plot(buffalo)
# This is the default projection for ctmm



