library(BAMMtools)


### Name: subsetEventData
### Title: Subset a 'bammdata' object
### Aliases: subsetEventData
### Keywords: manip

### ** Examples

data(whales, events.whales)
ed <- getEventData(whales, events.whales, nsamples=500)
ed2 <- subsetEventData(ed, index=1)
plot(ed2) 
addBAMMshifts(ed2, cex=2)



