library(SpatialExtremes)


### Name: lsmaxstab
### Title: Estimates the spatial dependence parameter of a max-stable
###   process by minimizing least squares.
### Aliases: lsmaxstab
### Keywords: htest

### ** Examples

n.site <- 50
n.obs <- 100
locations <- matrix(runif(2*n.site, 0, 40), ncol = 2)
colnames(locations) <- c("lon", "lat")

## Simulate a max-stable process - with unit Frechet margins
data <- rmaxstab(50, locations, cov.mod = "gauss", cov11 = 200, cov12 =
0, cov22 = 200)

lsmaxstab(data, locations, "gauss")

##Force an isotropic model and do not use weights
lsmaxstab(data, locations, "gauss", iso = TRUE, weighted = FALSE)



