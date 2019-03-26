library(vegclust)


### Name: vegclust-package
### Title: Fuzzy Clustering of Vegetation Data Functions for fuzzy and hard
###   clustering of vegetation data
### Aliases: vegclust-package
### Keywords: package

### ** Examples

## Loads data  
data(wetland)
  
## This equals the chord transformation 
wetland.chord = as.data.frame(sweep(as.matrix(wetland), 1, 
                              sqrt(rowSums(as.matrix(wetland)^2)), "/"))

## Create noise clustering with 3 clusters. Perform 10 starts from random seeds 
## and keep the best solution
wetland.nc = vegclust(wetland.chord, mobileCenters=3, m = 1.2, dnoise=0.75, 
                      method="NC", nstart=10)



