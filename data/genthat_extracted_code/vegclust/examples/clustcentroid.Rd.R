library(vegclust)


### Name: clustcentroid
### Title: Cluster centers of a classification
### Aliases: clustcentroid clustmedoid

### ** Examples

## Loads stats
library(stats)
  
## Loads data
data(wetland)
  
## This equals the chord transformation 
## (see also \code{decostand} in package 'vegan')
wetland.chord = as.data.frame(sweep(as.matrix(wetland), 1,
                              sqrt(rowSums(as.matrix(wetland)^2)), "/"))

## Performs a K-means clustering
wetland.km = kmeans(wetland.chord, centers=3, nstart=10)

## Gets the coordinates corresponding to the centroids of KM clusters
clustcentroid(wetland.chord, y=wetland.km$cluster)

## Gets the object indices corresponding to the medoids of KM clusters
clustmedoid(wetland.chord, y=wetland.km$cluster)




