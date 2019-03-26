library(STAR)


### Name: diff.spikeTrain
### Title: diff method for spikeTrain objects
### Aliases: diff.spikeTrain
### Keywords: ts

### ** Examples

data(CAL1S)
## convert data into spikeTrain objects
CAL1S <- lapply(CAL1S,as.spikeTrain)
## look at the individual trains
## first the "raw" data
CAL1S[["neuron 1"]]
## get the isi of neuron 1
n1.isi <- diff(CAL1S[["neuron 1"]])



