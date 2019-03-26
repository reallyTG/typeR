library(indicspecies)


### Name: signassoc
### Title: Statistical significance of species site-group associations
### Aliases: signassoc

### ** Examples

library(stats)

data(wetland) ## Load species data

wetkm = kmeans(wetland, centers=3)## Create three clusters using

## Look for species whose abundance is significantly higher in one of the three groups
signassoc(wetland, cluster=wetkm$cluster, mode=1, control = how(nperm=999))

## Look for species whose abundance is significantly higher in sites belonging 
## to one group as opposed to sites not belonging to it.
signassoc(wetland, cluster=wetkm$cluster, mode=0, control = how(nperm=999)) 



