library(indicspecies)


### Name: multipatt
### Title: Multi-level pattern analysis
### Aliases: multipatt

### ** Examples

library(stats)

data(wetland) ## Loads species data

wetkm = kmeans(wetland, centers=3) ## Creates three clusters using kmeans

## Runs the combination analysis using IndVal.g as statistic
wetpt = multipatt(wetland, wetkm$cluster, control = how(nperm=999)) 

## Lists those species with significant association to one combination
summary(wetpt) 

## Lists those species with significant association to one combination, 
## including indval components.
summary(wetpt, indvalcomp=TRUE) 



