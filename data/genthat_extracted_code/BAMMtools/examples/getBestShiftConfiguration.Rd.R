library(BAMMtools)


### Name: getBestShiftConfiguration
### Title: Get the best (sampled) rate shift configuration from a 'BAMM'
###   analysis
### Aliases: getBestShiftConfiguration
### Keywords: models

### ** Examples

data(whales, events.whales)
ed <- getEventData(whales, events.whales, burnin=0.1, nsamples=500)

# Get prior distribution on shifts-per-branch:
bp <- getBranchShiftPriors(whales, expectedNumberOfShifts = 1)

# Pass the event data object in to the function:
best <- getBestShiftConfiguration(ed, expectedNumberOfShifts = 1,
                                  threshold = 5)
plot(best, lwd=2)
addBAMMshifts(best, cex=2)

# Now we can also work with the credible shift set:
css <- credibleShiftSet(ed, expectedNumberOfShifts = 1, threshold = 5)

summary(css)

# examine model-averaged shifts from MAP configuration-
# This gives us parameters, times, and associated nodes
#   of each evolutionary rate regime (note that one of
#   them corresponds to the root)
css$eventData[[1]];

# Get bammdata representation of MAP configuration:
best <- getBestShiftConfiguration(css, expectedNumberOfShifts = 1,
                                  threshold = 5)

plot(best)
addBAMMshifts(best)



