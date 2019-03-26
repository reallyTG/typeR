library(tailDepFun)


### Name: EstimationBR
### Title: Estimation of the parameters of the Brown-Resnick process
### Aliases: EstimationBR

### ** Examples

## define the locations of 9 stations
## locations <- cbind(rep(c(1:3), each = 3), rep(1:3, 3))
## select the pairs of locations
## indices <- selectGrid(cst = c(0,1), d = 9, locations = locations, maxDistance = 1.5)
## The Brown-Resnick process
## set.seed(1)
## x <- SpatialExtremes::rmaxstab(n = 1000, coord = locations, cov.mod = "brown",
##                               range = 3, smooth = 1)
## Calculate the estimtors.
## EstimationBR(x, locations, indices, 100, method = "Mestimator", isotropic = TRUE,
##             covMat = FALSE)$theta
## EstimationBR(x, locations, indices, 100, method = "WLS", isotropic = TRUE,
## covMat = FALSE)$theta



