library(STAR)


### Name: as.repeatedTrain
### Title: Coerce and Test repeatedTrain Objects
### Aliases: as.repeatedTrain is.repeatedTrain
### Keywords: ts survival

### ** Examples

## load CAL1V data
data(CAL1V)
## convert them to repeatedTrain objects
CAL1V <- lapply(CAL1V, as.repeatedTrain)
## did the conversion work?
sapply(CAL1V, is.repeatedTrain)
## look at the raster of the 1st neuron
CAL1V[["neuron 1"]]



