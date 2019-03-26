library(RFmarkerDetector)


### Name: mccv
### Title: mccv class
### Aliases: mccv

### ** Examples

## load a simple dataset with the vectors of the predictions and the labels resulting from a CV 
data(simpleData)
mccv_obj <- mccv(simpleData$predictions, simpleData$labels, models = NULL)



