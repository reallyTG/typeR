library(SpatialExtremes)


### Name: rb
### Title: Creates a model using penalized smoothing splines
### Aliases: rb
### Keywords: htest

### ** Examples

n.site <- 30
locations <- matrix(runif(2*n.site, 0, 10), ncol = 2)
colnames(locations) <- c("lon", "lat")
knots <- quantile(locations[,2], 1:5/6)

form <- y ~ rb(lat, knots = knots, degree = 3, penalty = .5)



