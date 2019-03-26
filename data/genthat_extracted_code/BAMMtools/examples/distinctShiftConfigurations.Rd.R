library(BAMMtools)


### Name: distinctShiftConfigurations
### Title: Identify distinct rate shift configurations
### Aliases: distinctShiftConfigurations

### ** Examples

data(whales, events.whales)
ed <- getEventData(whales, events.whales, burnin=0.25, nsamples=500)

sc <- distinctShiftConfigurations(ed, expectedNumberOfShifts = 1,
                                  threshold = 5)

plot(sc, ed, rank=1)



