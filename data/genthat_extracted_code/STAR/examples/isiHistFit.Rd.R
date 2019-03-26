library(STAR)


### Name: isiHistFit
### Title: ISI Histogram With Fitted Model and CI
### Aliases: isiHistFit
### Keywords: distribution ts

### ** Examples

## Not run: 
##D ## load spontaneous data of 4 putative projection neurons
##D ## simultaneously recorded from the cockroach (Periplaneta
##D ## americana) antennal lobe
##D data(CAL1S)
##D ## convert data into spikeTrain objects
##D CAL1S <- lapply(CAL1S,as.spikeTrain)
##D ## look at the individual trains
##D ## first the "raw" data
##D CAL1S[["neuron 1"]]
##D ## next some summary information
##D summary(CAL1S[["neuron 1"]])
##D ## next the renewal tests
##D renewalTestPlot(CAL1S[["neuron 1"]])
##D ## It does not look too bad so let fit simple models
##D compModels(CAL1S[["neuron 1"]])
##D ## the best one is the invgauss. Let's look at
##D ## it in detail
##D isiHistFit(CAL1S[["neuron 1"]],"invgauss",xlim=c(0,0.5))
## End(Not run)



