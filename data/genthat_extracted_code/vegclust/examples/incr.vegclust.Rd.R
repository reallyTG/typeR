library(vegclust)


### Name: incr.vegclust
### Title: Noise clustering with increasing number of clusters
### Aliases: incr.vegclust

### ** Examples

## Loads data  
data(wetland)
  
## This equals the chord transformation 
## (see also \code{decostand} in package 'vegan')
wetland.chord = as.data.frame(sweep(as.matrix(wetland), 1,
                              sqrt(rowSums(as.matrix(wetland)^2)), "/"))

## Call incremental noise clustering 
wetland.nc = incr.vegclust(wetland.chord, method="NC", m = 1.2, dnoise=0.75, 
                           min.size=5)

## Inspect cluster sizes
print(wetland.nc$size)




