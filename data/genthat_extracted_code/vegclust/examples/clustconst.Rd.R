library(vegclust)


### Name: clustconst
### Title: Constancy table of a classification
### Aliases: clustconst summary.clustconst

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

## Gets constancy table of KM (i.e. hard) clusters
c=clustconst(wetland.chord, memb=as.memb(wetland.km$cluster))

## Prints constancy values ordered and store the result in d
d=summary(c, mode="all")

## Prints the most frequent species in the first cluster
summary(c, mode="cluster", name=names(c)[1])



