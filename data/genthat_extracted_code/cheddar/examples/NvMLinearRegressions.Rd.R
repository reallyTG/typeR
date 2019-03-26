library(cheddar)


### Name: NvMLinearRegressions
### Title: NvMLinearRegressions
### Aliases: NvMLinearRegressions NvMSlope NvMIntercept
###   NvMSlopeAndIntercept NvMSlopeByClass NvMInterceptByClass
###   NvMSlopeAndInterceptByClass
### Keywords: utilities

### ** Examples

data(TL84)

models <- NvMLinearRegressions(TL84)

# 'all', 'producer', 'invertebrate', 'vert.ecto'
names(models)

# Extract slopes and intercepts
sapply(models, coef)


# Slopes and intercepts through all data for each web in the pHWebs 
# collection
data(pHWebs)
CollectionCPS(pHWebs, properties=c('NvMSlope'))
CollectionCPS(pHWebs, properties=c('NvMIntercept'))
CollectionCPS(pHWebs, properties=c('NvMSlopeAndIntercept'))

# Slopes and intercepts through each category for each web in pHWebs
CollectionCPS(pHWebs, properties=c('NvMSlopeAndInterceptByClass'))



