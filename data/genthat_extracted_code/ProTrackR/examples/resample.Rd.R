library(ProTrackR)


### Name: resample
### Title: Resample data
### Aliases: resample

### ** Examples

some.data <- 1:100

## assume that the current (sample) rate
## of 'some.data' is 100, and we want to
## resample this data to a rate of 200:
resamp.data <- resample(some.data, 100, 200, method = "constant")



