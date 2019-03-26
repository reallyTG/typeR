library(vegclust)


### Name: defuzzify
### Title: Defuzzifies a fuzzy partition
### Aliases: defuzzify

### ** Examples

## Loads data  
data(wetland)
  
## This equals the chord transformation 
## (see also  \code{decostand} in package vegan)
wetland.chord = as.data.frame(sweep(as.matrix(wetland), 1, 
                              sqrt(rowSums(as.matrix(wetland)^2)), "/"))

## Create noise clustering with 3 clusters. Perform 10 starts from random seeds 
## and keep the best solution
wetland.nc = vegclust(wetland.chord, mobileCenters=3, m = 1.2, dnoise=0.75, 
                      method="NC", nstart=10)

## Defuzzification using an alpha-cut (alpha=0.5)
wetland.nc.df = defuzzify(wetland.nc$memb, method="cut")

## Cluster vector, with 'N' for objects that are unclassified, 
## and 'NA' for objects that are intermediate
print(wetland.nc.df$cluster)

## Hard membership matrix (site 22 does not get any cluster assigned)
print(wetland.nc.df$memb)




