library(SpatioTemporal)


### Name: loglikeSTnames
### Title: Create Names for Log-likelihood Parameters for STmodel objects
### Aliases: loglikeSTnames

### ** Examples

##load the data
data(mesa.model)

##Find out in which order parameters should be given
loglikeSTnames(mesa.model)
##...and for only the covariance parameters.
loglikeSTnames(mesa.model, FALSE)




