library(indicspecies)


### Name: coverage
### Title: Coverage of a set of indicators
### Aliases: coverage plotcoverage

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

## Determine the coverage of the selected set of indicators
coverage(sc)

## Plot the coverage against the threshold At
plotcoverage(sc)
plotcoverage(sc, max.order=2, add=TRUE, lty=2)

## Runs the combination analysis using IndVal.g as statistic
wetpt = multipatt(wetland, wetkm$cluster, control = how(nperm=999)) 
## Determines the coverage for each site group combination
coverage(wetland, wetpt)



