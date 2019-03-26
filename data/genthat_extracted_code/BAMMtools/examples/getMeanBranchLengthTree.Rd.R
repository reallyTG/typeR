library(BAMMtools)


### Name: getMeanBranchLengthTree
### Title: Compute phylogeny with branch lengths equal to corresponding
###   macroevolutionary rate estimates
### Aliases: getMeanBranchLengthTree
### Keywords: models

### ** Examples

data(whales)
data(events.whales)
ed <- getEventData(whales, events.whales, burnin=0.1, nsamples=500)
ed2 <- subsetEventData(ed, index = 1:20)
ratetree <- getMeanBranchLengthTree(ed2, rate='speciation')
plot(ratetree$phy, show.tip.label=FALSE)



