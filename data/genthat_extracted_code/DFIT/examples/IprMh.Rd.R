library(DFIT)


### Name: IprMh
### Title: Mantel Haenszel for Item parameter replication
### Aliases: IprMh

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
# # threePlMhIpr <- IprMh(itemParameterList = threePlIpr, irtModel = '3pl', logistic = TRUE)




