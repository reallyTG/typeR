library(SpatialExtremes)


### Name: madogram
### Title: Computes madograms
### Aliases: madogram
### Keywords: hplot

### ** Examples

n.site <- 15
locations <- matrix(runif(2*n.site, 0, 10), ncol = 2)
colnames(locations) <- c("lon", "lat")

##Simulate a max-stable process - with unit Frechet margins
data <- rmaxstab(40, locations, cov.mod = "whitmat", nugget = 0, range = 1,
smooth = 2)

##Compute the madogram
madogram(data, locations)

##Compare the madogram with a fitted max-stable model
fitted <- fitmaxstab(data, locations, "whitmat", nugget = 0)
madogram(fitted = fitted, which = "ext")



