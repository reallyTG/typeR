library(meteoland)


### Name: subsample
### Title: Sub-sampling procedure data
### Aliases: subsample subsample-methods
###   subsample,MeteorologyUncorrectedData-method
###   subsample,MeteorologyInterpolationData-method
### Keywords: methods

### ** Examples

data(exampleinterpolationdata)

oridates = exampleinterpolationdata@dates

#Interpolation data using the first ten dates (same boundary box)
subdata = subsample(exampleinterpolationdata, dates = oridates[1:10])



