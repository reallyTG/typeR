library(vegclust)


### Name: hier.vegclust
### Title: Clustering with several number of clusters
### Aliases: hier.vegclust random.vegclust hier.vegclustdist
###   random.vegclustdist

### ** Examples

## Loads data  
data(wetland)
  
## This equals the chord transformation 
## (see also  \code{decostand} in package vegan)
wetland.chord = as.data.frame(sweep(as.matrix(wetland), 1, 
                              sqrt(rowSums(as.matrix(wetland)^2)), "/"))

## Create noise clustering from hierarchical clustering at different number of clusters
wetland.hc = hclust(dist(wetland.chord),method="ward") 
wetland.nc1 = hier.vegclust(wetland.chord, wetland.hc, cmin=2, cmax=5, 
                            m = 1.2, dnoise=0.75, method="NC")

## Create noise clustering from random seeds at different levels
wetland.nc2 = random.vegclust(wetland.chord, cmin=2, cmax=5, nstart=10,
                              m = 1.2, dnoise=0.75, method="NC")



