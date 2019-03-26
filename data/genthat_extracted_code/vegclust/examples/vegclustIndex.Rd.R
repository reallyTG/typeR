library(vegclust)


### Name: vegclustIndex
### Title: Compute fuzzy evaluation statistics
### Aliases: vegclustIndex

### ** Examples


## Loads data  
data(wetland)
  
## This equals the chord transformation 
## (see also  \code{decostand} in package vegan)
wetland.chord = as.data.frame(sweep(as.matrix(wetland), 1, 
                              sqrt(rowSums(as.matrix(wetland)^2)), "/"))
                              
## Create noise clustering with 2, 3 and 4 clusters. Perform 10 starts from random seeds 
## and keep the best solutions
wetland.fcm2 = vegclust(wetland.chord, mobileCenters=2, m = 1.2, method="FCM", nstart=10)
wetland.fcm3 = vegclust(wetland.chord, mobileCenters=3, m = 1.2, method="FCM", nstart=10)
wetland.fcm4 = vegclust(wetland.chord, mobileCenters=4, m = 1.2, method="FCM", nstart=10)

## Compute statistics. Both PCN and PEN indicate that three groups are more advisable 
## than 2 or 4.
print(vegclustIndex(wetland.fcm2))
print(vegclustIndex(wetland.fcm3))
print(vegclustIndex(wetland.fcm4))




