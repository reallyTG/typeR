library(BAMMtools)


### Name: maximumShiftCredibility
### Title: Estimate maximum shift credibility configuration
### Aliases: maximumShiftCredibility
### Keywords: graphics manip

### ** Examples

data(whales, events.whales)
ed <- getEventData(whales, events.whales, burnin=0.25, nsamples=500)
best_config <- maximumShiftCredibility(ed)
plot(ed)
addBAMMshifts(ed, method='phylogram', index=best_config$sampleindex)



