library(timeordered)


### Name: generatetimeaggregatednetwork
### Title: Constructs a weighted time-aggregated network from a
###   time-ordered network by aggregating interactions occurring between a
###   start and stop time. Weights are stored as E(g)$weight.
### Aliases: generatetimeaggregatednetwork
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(ants)
allindivs <- c(union(ants$VertexFrom, ants$VertexTo), "NULL1", "NULL2")
g <- generatetonetwork(ants, allindivs)
tan500 <- generatetimeaggregatednetwork(g, 0, 500)
plottanet(tan500)




