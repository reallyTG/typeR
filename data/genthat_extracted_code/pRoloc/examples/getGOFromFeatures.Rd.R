library(pRoloc)


### Name: getGOFromFeatures
### Title: Retrieve GO terms for feature names
### Aliases: getGOFromFeatures

### ** Examples

library(pRolocdata)
data(dunkley2006)
data(dunkley2006params)
dunkley2006params
fn <- featureNames(dunkley2006)[1:5]
getGOFromFeatures(fn, params = dunkley2006params)



