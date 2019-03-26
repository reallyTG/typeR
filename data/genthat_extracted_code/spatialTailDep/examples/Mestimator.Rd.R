library(spatialTailDep)


### Name: Mestimator
### Title: Function 'Mestimator'
### Aliases: Mestimator

### ** Examples

## define the locations of 4 stations
(locations <- rbind(c(1,1),c(2,1),c(1,2),c(2,2)))
## select the pairs of locations; here, we select all locations
(pairIndices <- selectPairIndices(locations, maxDistance = 2))

## We use the rmaxstab function from the package SpatialExtremes to
## simulate from the Smith and the Brown-Resnick process.

## The Smith model
set.seed(2)
x<-rmaxstab(n = 5000, coord = locations,cov.mod="gauss",cov11=1,cov22=2,cov12=0.5)
## calculate the pairwise M-estimator. This may take up to one minute or longer.
## Mestimator(x, locations, pairIndices, 100, model="smith",Tol = 5e-04)

## The Brown-Resnick process
set.seed(2)
x <- rmaxstab(n = 5000, coord = locations, cov.mod = "brown", range = 3, smooth = 1)
## We can only simulate isotropic processes with rmaxstab, so we multiply the coordinates
## of the locations with V^(-1) (beta,c). Here we choose beta = 0.25 and c = 1.5
(Vmat<-matrix(c(cos(0.25),1.5*sin(0.25),-sin(0.25),1.5*cos(0.25)),nrow=2))
(locationsAniso <- locations %*% t(solve(Vmat)))
## calculate the pairwise M-estimator. This may take up to one minute or longer.
## Mestimator(x, locationsAniso, pairIndices, 300, model="BR",Tol = 5e-04)



