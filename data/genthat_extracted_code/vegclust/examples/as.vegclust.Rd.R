library(vegclust)


### Name: as.vegclust
### Title: Turns into vegclust objects
### Aliases: as.vegclust

### ** Examples

## Loads data  
data(wetland)

## This equals the chord transformation 
## (see also  \code{decostand} in package vegan)
wetland.chord = as.data.frame(sweep(as.matrix(wetland), 1, 
                              sqrt(rowSums(as.matrix(wetland)^2)), "/"))

## Splits wetland data into two matrices of 30x27 and 11x22
wetland.30 = wetland.chord[1:30,]
wetland.30 = wetland.30[,colSums(wetland.30)>0]
dim(wetland.30)
wetland.11 = wetland.chord[31:41,]
wetland.11 = wetland.11[,colSums(wetland.11)>0] 
dim(wetland.11)

## Performs a K-means clustering of the data set with 30 sites
wetland.km = kmeans(wetland.30, centers=3, nstart=10)

## Transforms the 'external' classification of 30 sites into a 'vegclust' object
wetland.30.vc = as.vegclust(wetland.30, wetland.km$cluster)

## Assigns the second set of sites according to the (k-means) membership rule 
## That is, sites are assigned to the cluster whose cluster centroids is nearest.
wetland.11.km = vegclass(wetland.30.vc, wetland.11)

## A similar 'vegclust' object is obtained when using the distance mode...
wetland.d.vc = as.vegclust(dist(wetland.30), wetland.km$cluster)

## which can be also used to produce the assignment of the second set of objects
wetland.d.11 = as.data.frame(as.matrix(dist(wetland.chord)))[31:41,1:30]
wetland.d.11.km = vegclass(wetland.d.vc,wetland.d.11)



