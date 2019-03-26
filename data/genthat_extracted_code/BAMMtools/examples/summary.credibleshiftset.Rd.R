library(BAMMtools)


### Name: summary.credibleshiftset
### Title: Summary of credible set of shift configurations from a 'BAMM'
###   analysis
### Aliases: print.credibleshiftset summary.credibleshiftset
### Keywords: models

### ** Examples

data(whales, events.whales)
ed <- getEventData(whales, events.whales, nsamples = 500)
cset <- credibleShiftSet(ed, expectedNumberOfShifts = 1, threshold = 5)
summary(cset)



