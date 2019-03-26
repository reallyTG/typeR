library(timeordered)


### Name: plotnetworkslices
### Title: Plots a time-aggregated network
### Aliases: plotnetworkslices
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(ants)
allindivs <- c(union(ants$VertexFrom, ants$VertexTo), "NULL1", "NULL2")
g <- generatetonetwork(ants, allindivs)
td100 <- generatetimedeltas(0,1500,100)
ns100 <- generatenetworkslices(g, td100)
plotnetworkslices(ns100, td100)



