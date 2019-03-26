library(timeordered)


### Name: plottanet
### Title: Plots a time-aggregated network.
### Aliases: plottanet
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(ants)
allindivs <- c(union(ants$VertexFrom, ants$VertexTo), "NULL1", "NULL2")
g <- generatetonetwork(ants, allindivs)
tan <- generatetimeaggregatednetwork(g, 0, 500)
plottanet(tan,layout=layout.kamada.kawai)



