library(colorednoise)


### Name: unstructured_pop
### Title: Simulated Time Series of an Unstructured Temporally
###   Autocorrelated Population
### Aliases: unstructured_pop

### ** Examples

series1 <- unstructured_pop(start = 20, timesteps = 10, survPhi = 0.7, fecundPhi = -0.1,
survMean = 0.6, survSd = 0.52, fecundMean = 1.2, fecundSd = 0.7)
head(series1)



