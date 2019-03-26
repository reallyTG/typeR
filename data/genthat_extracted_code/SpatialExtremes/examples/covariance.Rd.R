library(SpatialExtremes)


### Name: covariance
### Title: Defines and computes covariance functions
### Aliases: covariance
### Keywords: htest

### ** Examples

## 1- Calling covariance using fixed covariance parameters
covariance(nugget = 0, sill = 1, range = 1, smooth = 0.5, cov.mod = "whitmat")
covariance(nugget = 0, sill = 0.5, range = 1, smooth = 0.5, cov.mod = "whitmat",
  dist = seq(0,5, 0.2), plot = FALSE)

## 2- Calling covariance from a fitted model
##Define the coordinate of each location
n.site <- 30
locations <- matrix(runif(2*n.site, 0, 10), ncol = 2)
colnames(locations) <- c("lon", "lat")

##Simulate a max-stable process - with unit Frechet margins
data <- rmaxstab(30, locations, cov.mod = "whitmat", nugget = 0, range =
3, smooth = 1)

##Fit a max-stable model
fitted <- fitmaxstab(data, locations, "whitmat", nugget = 0)
covariance(fitted, ylim = c(0, 1))
covariance(nugget = 0, sill = 1, range = 3, smooth = 1, cov.mod = "whitmat", add =
TRUE, col = 3)
title("Whittle-Matern covariance function")
legend("topright", c("Theo.", "Fitted"), lty = 1, col = c(3,1), inset =
.05)



