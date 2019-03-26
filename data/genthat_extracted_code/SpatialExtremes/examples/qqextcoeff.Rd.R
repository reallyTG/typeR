library(SpatialExtremes)


### Name: qqextcoeff
### Title: QQ-plot for the extremal coefficient
### Aliases: qqextcoeff
### Keywords: hplot

### ** Examples

##Define the coordinate of each location
n.site <- 30
locations <- matrix(runif(2*n.site, 0, 10), ncol = 2)
colnames(locations) <- c("lon", "lat")

##Simulate a max-stable process - with unit Frechet margins
data <- rmaxstab(50, locations, cov.mod = "gauss", cov11 = 10, cov12 =
5, cov22 = 22)

fitted <- fitmaxstab(data, locations, "gauss")
qqextcoeff(fitted)



