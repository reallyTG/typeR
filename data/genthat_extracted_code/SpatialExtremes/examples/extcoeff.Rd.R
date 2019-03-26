library(SpatialExtremes)


### Name: extcoeff
### Title: Plots the extremal coefficient
### Aliases: extcoeff
### Keywords: hplot

### ** Examples

## 1- Random field generation
n.site <- 30
locations <- matrix(runif(2*n.site, 0, 10), ncol = 2)
colnames(locations) <- c("lon", "lat")

data <- rmaxstab(60, locations, cov.mod = "whitmat", nugget = 0, range =
3, smooth = 1)

## 2- Fit a max-stable processes
schlather <- fitmaxstab(data, locations, "whitmat", nugget = 0)

## 3- Plot the extremal coefficient
extcoeff(schlather)



