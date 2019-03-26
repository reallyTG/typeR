library(vegclust)


### Name: clustvar
### Title: Cluster variance
### Aliases: clustvar

### ** Examples

## Loads data  
data(wetland)

## This equals the chord transformation 
## (see also \code{decostand} in package 'vegan')
wetland.chord = as.data.frame(sweep(as.matrix(wetland), 1, 
                              sqrt(rowSums(as.matrix(wetland)^2)), "/"))

## Create noise clustering with 3 clusters. Perform 10 starts from random seeds 
## and keep the best solution
wetland.nc = vegclust(wetland.chord, mobileCenters=3, m = 1.2, dnoise=0.75, 
                      method="NC", nstart=10)

## Gets cluster variance of fuzzy clusters
clustvar(wetland.nc)

## Gets cluster variance of fuzzy clusters after defuzzification
clustvar(wetland.nc, defuzzify=TRUE)

## Similar to the previous, this gets cluster variance of defuzzified (i.e. hard) clusters
clustvar(wetland.chord, cluster=defuzzify(wetland.nc)$cluster)

## Gets cluster variance of K-means (i.e. hard) clusters
clustvar(wetland.chord, cluster=kmeans(wetland.chord, centers=3, nstart=10)$cluster)




