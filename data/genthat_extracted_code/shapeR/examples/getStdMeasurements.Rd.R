library(shapeR)


### Name: getStdMeasurements
### Title: Get simple shape variables after standardization, filtered
###   according to filter
### Aliases: getStdMeasurements

### ** Examples

data(shape)
#Calculate the mean standardized otolith length for each fish population
tapply(getStdMeasurements(shape)$otolith.length,
getMasterlist(shape)$pop,mean)



