library(vegclust)


### Name: vegclass
### Title: Classifies vegetation communities
### Aliases: vegclass

### ** Examples

## Loads data (38 columns and 33 species)
data(wetland)
dim(wetland)
  
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

## Create noise clustering with 3 clusters from the data set with 30 sites. 
wetland.30.nc = vegclust(wetland.30, mobileCenters=3, m = 1.2, dnoise=0.75,
                         method="NC", nstart=10)

## Cardinality of fuzzy clusters (i.e., the number of objects belonging to)
wetland.30.nc$size

## Classifies the second set of sites according to the clustering of the first set
wetland.11.nc = vegclass(wetland.30.nc, wetland.11)

## Fuzzy membership matrix
wetland.11.nc$memb

## Obtains hard membership vector, with 'N' for objects that are unclassified
defuzzify(wetland.11.nc$memb)$cluster




