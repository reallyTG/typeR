library(vegclust)


### Name: vegclust
### Title: Vegetation clustering methods
### Aliases: vegclust vegclustdist

### ** Examples

## Loads data  
data(wetland)
  
## This equals the chord transformation 
## (see also 'decostand' in package vegan)
wetland.chord = as.data.frame(sweep(as.matrix(wetland), 1, 
                              sqrt(rowSums(as.matrix(wetland)^2)), "/"))

## Create noise clustering with 3 clusters. Perform 10 starts from random seeds 
## and keep the best solution
wetland.nc = vegclust(wetland.chord, mobileCenters=3, m = 1.2, dnoise=0.75, 
                      method="NC", nstart=10)

## Fuzzy membership matrix
wetland.nc$memb

## Cardinality of fuzzy clusters (i.e., the number of objects belonging to each cluster)
wetland.nc$size

## Obtains hard membership vector, with 'N' for objects that are unclassified
defuzzify(wetland.nc$memb)$cluster

## The same result is obtained with a matrix of chord distances
wetland.d = dist(wetland.chord)
wetland.d.nc = vegclustdist(wetland.d, mobileMemb=3, m = 1.2, dnoise=0.75, 
                            method="NC", nstart=10)



