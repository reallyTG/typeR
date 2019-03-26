library(SpatialExtremes)


### Name: fitcovmat
### Title: Estimates the covariance matrix for the Smith's model
### Aliases: fitcovmat
### Keywords: htest

### ** Examples

n.site <- 50
n.obs <- 100
locations <- matrix(runif(2*n.site, 0, 40), ncol = 2)
colnames(locations) <- c("lon", "lat")

## Simulate a max-stable process - with unit Frechet margins
data <- rmaxstab(50, locations, cov.mod = "gauss", cov11 = 200, cov12 =
0, cov22 = 200)

fitcovmat(data, locations)

##Force an isotropic model
fitcovmat(data, locations, iso = TRUE)



