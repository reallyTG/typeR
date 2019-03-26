library(sensors4plumes)


### Name: extractSpatialDataFrame
### Title: Extract some values of Simulations to a SpatialDataFrame with
###   the same spatial properties.
### Aliases: extractSpatialDataFrame

### ** Examples

data(SimulationsSmall)
SimulationsSmall_134_21 = extractSpatialDataFrame(
  SimulationsSmall,
  plumes = c(1,3,4), kinds = c(2,1))



