library(vegclust)


### Name: crossmemb
### Title: Cross-table of two fuzzy classifications
### Aliases: crossmemb

### ** Examples

## Loads data  
data(wetland)
  
## This equals the chord transformation 
## (see also  \code{decostand} in package vegan)
wetland.chord = as.data.frame(sweep(as.matrix(wetland), 1, 
                              sqrt(rowSums(as.matrix(wetland)^2)), "/"))


## Create clustering with 3 clusters. Perform 10 starts from random seeds 
## and keep the best solution. Try both FCM and NC methods:
wetland.fcm = vegclust(wetland.chord, mobileCenters=3, m = 1.2, method="FCM", nstart=10)
wetland.nc = vegclust(wetland.chord, mobileCenters=3, m = 1.2, dnoise=0.75, method="NC", 
                      nstart=10)

## Compare the results
crossmemb(wetland.fcm, wetland.nc, relativize=FALSE)



