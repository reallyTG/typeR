library(vegclust)


### Name: vegclust2kmeans
### Title: Reshapes as kmeans object
### Aliases: vegclust2kmeans

### ** Examples

## Loads data  
data(wetland)
  
## This equals the chord transformation 
## (see also  \code{decostand} in package vegan)
wetland.chord = as.data.frame(sweep(as.matrix(wetland), 1, 
                              sqrt(rowSums(as.matrix(wetland)^2)), "/"))

## Create noise clustering with 3 clusters. Perform 10 starts from random seeds 
wetland.vc = vegclust(wetland.chord, mobileCenters=3, 
                      method="KM", nstart=10)

## Reshapes as kmeans object
wetland.km = vegclust2kmeans(wetland.vc)
wetland.km



