library(spatialClust)


### Name: spClustIndex
### Title: Cluster Validity Index
### Aliases: spClustIndex

### ** Examples

#load data example
X <- example

#if using matrix distance
distance <- dist

#if using shapefile
#library(rgdal) for call readOGR
#distance <- readOGR(dsn = 'folder/.',"shapefile name")

#load population data
pop <- population

clust <- fgwc(X,pop,distance,K=2,m=1.5,beta=0.5)

#show cluster validation
spClustIndex(clust)





