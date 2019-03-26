library(timeordered)


### Name: shortesttimepath
### Title: Determines a path (shortest by the least time) between a vertex
###   at a start time and another vertex at any later time.
### Aliases: shortesttimepath
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(ants)
allindivs <- c(union(ants$VertexFrom, ants$VertexTo), "NULL1", "NULL2")
g <- generatetonetwork(ants, allindivs)
stp <- shortesttimepath(g, "WBGG", 927, "Q")
plottonet(g, stp)
title(paste(diff(range(stp$Time)), "time elapsed"))




