library(BAMMtools)


### Name: cumulativeShiftProbsTree
### Title: Branch-specific rate shift probabilities
### Aliases: cumulativeShiftProbsTree marginalShiftProbsTree
### Keywords: graphics

### ** Examples

data(whales)
data(events.whales)
ed <- getEventData(whales, events.whales, nsamples = 500)

# computing the marginal shift probs tree:
mst <- marginalShiftProbsTree(ed)

# The cumulative shift probs tree:
cst <- cumulativeShiftProbsTree(ed)

#compare the two types of shift trees side-by-side:
plot.new()
par(mfrow=c(1,2))
plot.phylo(mst, no.margin=TRUE, show.tip.label=FALSE)
plot.phylo(cst, no.margin=TRUE, show.tip.label=FALSE)



