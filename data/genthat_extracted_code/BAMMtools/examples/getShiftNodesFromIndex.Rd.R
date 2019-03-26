library(BAMMtools)


### Name: getShiftNodesFromIndex
### Title: Identify nodes associated with rate shifts from 'bammdata'
###   object
### Aliases: getShiftNodesFromIndex
### Keywords: models

### ** Examples

data(whales, events.whales)
ed <- getEventData(whales, events.whales, burnin=0.1, nsamples=500)

# Get the maximum shift credibility configuration:
msc <- maximumShiftCredibility(ed)

# Get the nodes at which shifts occurred in the 
# maximum shift credibility configuration:

getShiftNodesFromIndex(ed, index=msc$sampleindex)



