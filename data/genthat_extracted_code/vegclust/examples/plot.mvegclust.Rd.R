library(vegclust)


### Name: plot.mvegclust
### Title: Plots clustering results
### Aliases: plot.mvegclust

### ** Examples

## Loads data  
data(wetland)
  
## This equals the chord transformation 
## (see also \code{decostand} in package 'vegan')
wetland.chord = as.data.frame(sweep(as.matrix(wetland), 1, 
                              sqrt(rowSums(as.matrix(wetland)^2)), "/"))

## Create noise clustering from hierarchical clustering at different number of clusters
wetland.hc = hclust(dist(wetland.chord),method="ward") 
wetland.nc = hier.vegclust(wetland.chord, wetland.hc, cmin=2, cmax=5, m = 1.2, 
                           dnoise=0.75, method="NC")

## Plot changes in the number of objects falling into the noise cluster
plot(wetland.nc, type="hnc")

## Plots the number of objects falling into "true" clusters, 
## the number of objects considered intermediate, 
## and the number of objects falling into the noise
plot(wetland.nc, type="hmemb")

## Plot minimum, maximum and average cluster size
plot(wetland.nc, type="hcs")

## Plot minimum, maximum and average cluster variance
plot(wetland.nc, type="var")

## Plot number of groups with high variance, low membership or both
plot(wetland.nc, type="valid")



