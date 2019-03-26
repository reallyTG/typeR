library(SpatialExtremes)


### Name: fitcovariance
### Title: Estimates the covariance function for the Schlather's model
### Aliases: fitcovariance
### Keywords: htest

### ** Examples

n.site <- 50
locations <- matrix(runif(2*n.site, 0, 10), ncol = 2)
colnames(locations) <- c("lon", "lat")

##Simulating a max-stable process using RandomFields
##This is the Schlather's approach
data <- rmaxstab(50, locations, cov.mod = "whitmat", nugget = 0, range =
30, smooth = 1)

fitcovariance(data, locations, "whitmat")



