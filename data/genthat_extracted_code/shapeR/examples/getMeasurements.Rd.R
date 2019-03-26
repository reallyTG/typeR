library(shapeR)


### Name: getMeasurements
### Title: Get simple shape variables, filtered according to filter
### Aliases: getMeasurements

### ** Examples

data(shape)
# Calculate the mean otolith area for each fish population
# The results are in square mm since the calibration ('cal') column
# in the data file is in pixels (1 mm/pixel).
tapply(getMeasurements(shape)$otolith.area, getMasterlist(shape)$pop,mean)



