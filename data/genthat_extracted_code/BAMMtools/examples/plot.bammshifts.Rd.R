library(BAMMtools)


### Name: plot.bammshifts
### Title: Plot distinct rate shift configurations on a phylogeny
### Aliases: plot.bammshifts

### ** Examples

data(whales, events.whales)

ed <- getEventData(whales, events.whales, burnin=0.25, nsamples=500)

sc <- distinctShiftConfigurations(ed, expectedNumberOfShifts = 1,
                                  threshold = 5)

plot(sc, ed)



