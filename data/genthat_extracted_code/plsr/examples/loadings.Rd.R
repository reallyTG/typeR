library(plsr)


### Name: loadings
### Title: Print loadings of plsr object
### Aliases: loadings

### ** Examples

plsr_obj = pls(rating_data,tracking_data,10,10)
loadings(plsr_obj) #show V and U
loadings(plsr_obj,"V") #show V only
loadings(plsr_obj,"U") #show U only



