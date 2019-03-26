library(nat)


### Name: summary.neuronlist
### Title: Summary statistics for neurons (e.g. cable length, number of
###   nodes)
### Aliases: summary.neuronlist summary summary.neuron summary.dotprops

### ** Examples

# summary for a whole neuronlist
summary(Cell07PNs)
# including the attached data.frame with additional metadata
head(summary(Cell07PNs, include.attached.dataframe = FALSE))
# for a single regular format neuron
summary(Cell07PNs[[1]])
# for a single dotprops format neuron
summary(kcs20[[1]])
# specify a different estimate for the cable length associated with a single
# point in the neuron
summary(kcs20[[1]], veclength=1.2)



