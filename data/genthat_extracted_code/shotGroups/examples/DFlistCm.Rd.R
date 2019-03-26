library(shotGroups)


### Name: DFlistCm
### Title: List containing several data frames with bullet hole data
### Aliases: DFlistCm
### Keywords: datasets

### ** Examples

data(DFlistCm)
str(DFlistCm)

## combine list of data frames to one single data frame
DFcm <- combineData(DFlistCm)
str(DFcm)



