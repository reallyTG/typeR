library(SpatialExtremes)


### Name: fitextcoeff
### Title: Non parametric estimators of the extremal coefficient function
### Aliases: fitextcoeff
### Keywords: hplot

### ** Examples

n.site <- 30
locations <- matrix(runif(2*n.site, 0, 10), ncol = 2)
colnames(locations) <- c("lon", "lat")

##Simulate a max-stable process - with unit Frechet margins
data <- rmaxstab(50, locations, cov.mod = "gauss", cov11 = 10, cov12 =
40, cov22 = 220)

##Plot the extremal coefficient function
op <- par(mfrow=c(1,2))
fitextcoeff(data, locations, estim = "Smith")
fitextcoeff(data, locations, angles = seq(-pi, pi, length = 4), estim = "Smith")
par(op)



