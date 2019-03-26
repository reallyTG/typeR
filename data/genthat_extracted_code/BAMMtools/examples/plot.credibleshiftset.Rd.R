library(BAMMtools)


### Name: plot.credibleshiftset
### Title: Plot credible set of rate shift configurations from 'BAMM'
###   analysis
### Aliases: plot.credibleshiftset

### ** Examples

data(events.whales)
data(whales)
ed <- getEventData(whales, events.whales, nsamples=500)
cset <- credibleShiftSet(ed, expectedNumberOfShifts = 1, threshold = 5)
plot(cset)



