library(indicspecies)


### Name: summary.multipatt
### Title: Summarizing multi-level pattern analysis
### Aliases: summary.multipatt

### ** Examples

library(stats)

## Loads species data
data(wetland) 

## Creates three clusters using kmeans
wetkm = kmeans(wetland, centers=3) 

## Runs the combination analysis using IndVal.g as statistic
wetpt = multipatt(wetland, wetkm$cluster) 

## Lists those species with significant association to one combination
summary(wetpt) 

## Lists those species with significant association to one combination, 
## including indval components
summary(wetpt, indvalcomp=TRUE) 



