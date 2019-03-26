library(indicspecies)


### Name: combinespecies
### Title: Combines species from a community table
### Aliases: combinespecies

### ** Examples

library(stats)

data(wetland) ## Loads species data

## Create species combinations
Y=combinespecies(X=wetland, max.order=3, min.occ=5, verbose=TRUE)

## Creates three site groups using kmeans
wetkm = kmeans(wetland, centers=3) 

## Calculate indicator value of species combinations for each of the three site groups
strassoc(Y$XC, cluster=wetkm$cluster,func="IndVal.g") 

## Calculate point biserial correlation value of species combinations 
## for each of the three site groups
strassoc(Y$XC, cluster=wetkm$cluster,func="r.g") 




