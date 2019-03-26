library(SpatialExtremes)


### Name: fmadogram
### Title: Computes the F-madogram
### Aliases: fmadogram
### Keywords: hplot

### ** Examples

n.site <- 15
locations <- matrix(runif(2*n.site, 0, 10), ncol = 2)
colnames(locations) <- c("lon", "lat")

##Simulate a max-stable process - with unit Frechet margins
data <- rmaxstab(40, locations, cov.mod = "whitmat", nugget = 0, range = 1,
smooth = 2)

##Compute the F-madogram
fmadogram(data, locations)

##Compare the F-madogram with a fitted max-stable process
fitted <- fitmaxstab(data, locations, "whitmat", nugget = 0)
fmadogram(fitted = fitted, which = "ext")



