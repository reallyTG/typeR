library(BAMMtools)


### Name: addBAMMshifts
### Title: Add 'BAMM'-inferred rate shifts to a phylogeny plot
### Aliases: addBAMMshifts
### Keywords: graphics

### ** Examples

data(whales, events.whales)
ed <- getEventData(whales, events.whales, burnin=0.25, nsamples = 500)

# adding shifts to tree for specific posterior samples
plot(ed, method="polar")
addBAMMshifts(ed, index=5, "polar")

# multi-panel plotting and adding shifts
par(mfrow=c(2,3),mar=c(5,1,1,1))
samples = sample(1:length(ed$eventData), 6)
for (i in 1:6) {
  sed <- subsetEventData(ed, samples[i])
  plot(sed, par.reset=FALSE)
  addBAMMshifts(sed,index=1,method="phylogram",par.reset=FALSE)	
}



