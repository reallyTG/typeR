library(sensors4plumes)


### Name: SDF2simulations
### Title: Turn a SpatialDataFrame into Simulations.
### Aliases: SDF2simulations

### ** Examples

data(SimulationsSmall)
SimulationsSmall_134_21 = extractSpatialDataFrame(
  SimulationsSmall,
  plumes = c(1,3,4), kinds = c(2,1))



