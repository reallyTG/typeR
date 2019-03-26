library(STAR)


### Name: as.spikeTrain
### Title: Coerce, Test and Extract from spikeTrain Objects
### Aliases: as.spikeTrain is.spikeTrain [.spikeTrain
### Keywords: ts survival

### ** Examples

## load CAL1S data
data(CAL1S)
## convert the data into spikeTrain objects
CAL1S <- lapply(CAL1S,as.spikeTrain)
## Are the list eleemnts now spikeTrain objects?
sapply(CAL1S, is.spikeTrain)
## look at the train of the 1st neuron
CAL1S[["neuron 1"]]
## look at the window 10-40 using the extractor function
CAL1S[["neuron 1"]][10 < CAL1S[["neuron 1"]] & CAL1S[["neuron 1"]] < 40] 




