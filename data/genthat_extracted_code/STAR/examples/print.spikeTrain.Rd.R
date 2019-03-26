library(STAR)


### Name: print.spikeTrain
### Title: Print and Summary Methods for spikeTrain Objects
### Aliases: print.spikeTrain summary.spikeTrain
### Keywords: ts survival

### ** Examples

## load spontaneous data of 4 putative projection neurons
## simultaneously recorded from the cockroach (Periplaneta
## americana) antennal lobe
data(CAL1S)
## convert data into spikeTrain objects
CAL1S <- lapply(CAL1S,as.spikeTrain)
## look at the individual trains
## first the "raw" data
CAL1S[["neuron 1"]]
## next some summary information
summary(CAL1S[["neuron 1"]])



