library(inlmisc)


### Name: GetRegionOfInterest
### Title: Get Region of Interest
### Aliases: GetRegionOfInterest
### Keywords: utilities

### ** Examples

set.seed(123)

n <- 50
x <- list(x = stats::runif(n), y = stats::runif(n))
sp::plot(GetRegionOfInterest(x, width = 0.05), border = "blue", lty = 2)
sp::plot(GetRegionOfInterest(x), border = "red", add = TRUE)
sp::plot(GetRegionOfInterest(x, width = -0.05), lty = 2, add = TRUE)
points(x, pch = 3)

## Not run: 
##D n <- 300
##D theta <- stats::runif(n, 0, 2 * pi)
##D r <- sqrt(stats::runif(n, 0.25^2, 0.50^2))
##D x <- sp::SpatialPoints(cbind(0.5 + r * cos(theta), 0.5 + r * sin(theta)),
##D                        proj4string = sp::CRS("+init=epsg:32610"))
##D sp::plot(GetRegionOfInterest(x, alpha = 0.1, width = 0.05), col = "green")
##D sp::plot(GetRegionOfInterest(x, alpha = 0.1), col = "yellow", add = TRUE)
##D sp::plot(x, add = TRUE)
## End(Not run)




