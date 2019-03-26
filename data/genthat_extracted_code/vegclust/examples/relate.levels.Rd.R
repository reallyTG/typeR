library(vegclust)


### Name: relate.levels
### Title: Relates two clustering level results.
### Aliases: relate.levels

### ** Examples

## Loads data  
data(wetland)
  
## This equals the chord transformation 
## (see also  \code{decostand} in package vegan)
wetland.chord = as.data.frame(sweep(as.matrix(wetland), 1,
                              sqrt(rowSums(as.matrix(wetland)^2)), "/"))

## Create noise clustering from hierarchical clustering at different number of cluster
wetland.hc = hclust(dist(wetland.chord),method="ward") 
wetland.nc1 = hier.vegclust(wetland.chord, wetland.hc, cmin=2, cmax=6, m = 1.2, 
                            dnoise=0.75, method="NC")
wetland.nc2 = hier.vegclust(wetland.chord, wetland.hc, cmin=2, cmax=4, m = 1.2, 
                            dnoise=0.85, method="NC")

## Studies the assignment of levels
relate.levels(wetland.nc1, wetland.nc2, method="cut")



