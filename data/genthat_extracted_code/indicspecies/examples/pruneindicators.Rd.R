library(indicspecies)


### Name: pruneindicators
### Title: Determines the best subset of indicators
### Aliases: pruneindicators

### ** Examples

library(stats)

data(wetland) ## Loads species data

## Creates three clusters using kmeans
wetkm = kmeans(wetland, centers=3) 

## Determine sensitivity of individual species
B=strassoc(wetland, cluster=wetkm$cluster,func="B") 

## Select species with more than 20% of sensitivity for the first group
sel=which(B[,1]>0.2) 

## Run indicator analysis with species combinations for the first group
sc= indicators(X=wetland[,sel], cluster=wetkm$cluster, group=1, verbose=TRUE, At=0.5, Bt=0.2)

## Finds the 'best' subset of indicators
sc2=pruneindicators(sc, At=0.5, Bt=0.2, verbose=TRUE)
print(sc2)




