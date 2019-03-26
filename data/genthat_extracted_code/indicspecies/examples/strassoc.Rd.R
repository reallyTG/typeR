library(indicspecies)


### Name: strassoc
### Title: Strength of species site-group associations
### Aliases: strassoc

### ** Examples

## Load species data
data(wetland) 

## Create three clusters using
wetkm = kmeans(wetland, centers=3)

## Compute Dufrene and Legendre's IndVal
strassoc(wetland, wetkm$cluster, func="IndVal.g") 

## Compute point-biserial correlation, with bootstrap 95 percent confidence intervals
strassoc(wetland, wetkm$cluster, func="r", nboot =100) 



