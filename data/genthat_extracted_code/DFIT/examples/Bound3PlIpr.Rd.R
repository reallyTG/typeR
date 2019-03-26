library(DFIT)


### Name: Bound3PlIpr
### Title: Takes item parameters frp, Ipr and forces guessing to lie
###   between 0 and 1
### Aliases: Bound3PlIpr

### ** Examples

# # Not run
# #
# # data(dichotomousItemParameters)
# # threePlAse <- list()
# # threePlAse[['focal']] <- AseIrt(itemParameters = dichotomousItemParameters[['focal']],
# #                                 logistic = TRUE, sampleSize = 500, irtModel = '3pl')
# # threePlAse[['reference']] <- AseIrt(itemParameters = dichotomousItemParameters[['reference']],
# #                                     logistic = TRUE, sampleSize = 500, irtModel = '3pl')
# # threePlIpr <- Ipr(itemParameters = dichotomousItemParameters, itemCovariances = threePlAse,
# #                   nReplicates = 1000)
# # threePlIpr <- Bound3PlIpr(threePlIpr)




