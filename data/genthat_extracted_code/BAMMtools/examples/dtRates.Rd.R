library(BAMMtools)


### Name: dtRates
### Title: Calculate macroevolutionary rate changes on a phylogeny from
###   'BAMM' output
### Aliases: dtRates
### Keywords: graphics

### ** Examples

data(whales, events.whales)
ed <- getEventData(whales, events.whales, burnin=0.25, nsamples=500)

# use all posterior samples
ed <- dtRates(ed, tau=0.01)

# use specified range of posterior samples
ed <- dtRates(ed, tau=0.01, ism=50:150)



