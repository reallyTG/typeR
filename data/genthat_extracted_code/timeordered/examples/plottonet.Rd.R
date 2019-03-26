library(timeordered)


### Name: plottonet
### Title: Plots a time-ordered network.
### Aliases: plottonet
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(ants)
allindivs <- c(union(ants$VertexFrom, ants$VertexTo), "NULL1", "NULL2")
g <- generatetonetwork(ants, allindivs)
plottonet(g)





