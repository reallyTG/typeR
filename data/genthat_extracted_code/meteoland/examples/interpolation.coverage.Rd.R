library(meteoland)


### Name: interpolation.coverage
### Title: Spatial and temporal coverage of interpolation data
### Aliases: interpolation.coverage

### ** Examples

data(exampleinterpolationdata)

#Number of days with data per station
head(interpolation.coverage(exampleinterpolationdata))

#Number of stations with data per day
head(interpolation.coverage(exampleinterpolationdata, type = "temporal"))



