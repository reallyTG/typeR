library(tdr)


### Name: Stats
### Title: Error Statistics
### Aliases: tdStats applyStats pvObs pvModels

### ** Examples

data(modelEx)

## Analyze one model
tdStats(pvModels$M01, pvObs)

## Analyze a set of models
applyStats(pvModels, pvObs)



